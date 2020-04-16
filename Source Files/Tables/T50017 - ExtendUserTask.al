tableextension 50017 ExtendUserTask extends "User Task"
{
    Caption = 'User task';
    fields
    {
        field(50000; "Link Document No"; code[20])
        {
            Caption = 'Link Document No.';

        }
        field(50001; "CBR Notes"; Blob)
        {
            Caption = 'Notes';

        }

    }

    procedure CBRCreateUserTask(DocType: Text[30]; DocNo: Code[20]; VAR TaskID: Integer)
    begin
        UserTask.INIT;
        UserTask.ID := GetLastID;
        UserTask.Title := FORMAT(DocType) + '-' + DocNo;
        DateValue := CALCDATE('1D', TODAY);
        UserTask."Start DateTime" := CREATEDATETIME(DateValue, TIME);
        UserTask."Due DateTime" := CREATEDATETIME(DateValue, TIME);
        UserTask.validate("Object Type", UserTask."Object Type"::Page);
        UserTask."Link Document No" := DocNo;
        case DocType of
            'Service Order':
                UserTask.Validate("Object ID", 5900);
            'Sales Order':
                UserTask.Validate("Object ID", 42);
            'Purchase Order':
                UserTask.Validate("Object ID", 56);
        end;
        UserTask.INSERT(TRUE);
        TaskID := UserTask.ID;
    end;

    var
        UserTask: Record "User Task";
        DateValue: Date;

    LOCAL procedure GetLastID() ID: Integer
    begin
        UserTaskRec.RESET;
        IF UserTaskRec.FINDLAST THEN
            EXIT(UserTaskRec.ID + 1)
        ELSE
            EXIT(1);
    end;

    procedure SetCBRNotes(StreamText: Text)
    var
        OutStream: OutStream;
    begin
        Clear("CBR Notes");
        "CBR Notes".CreateOutStream(OutStream, TEXTENCODING::Windows);
        OutStream.Write(StreamText);
        if Modify(true) then;
    end;

    procedure GetCBRNotes(): Text
    var
        TempBlob: Codeunit "Temp Blob";
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        TempBlob.FromRecord(Rec, FieldNo(Description));
        TempBlob.CreateInStream(InStream, TEXTENCODING::Windows);
        exit(TypeHelper.ReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator));
    end;

    var
        UserTaskRec: Record "User Task";
}
