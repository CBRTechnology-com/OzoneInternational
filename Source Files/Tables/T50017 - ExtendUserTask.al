tableextension 50017 ExtendUserTask extends "User Task"
{
    Caption = 'User task';
    fields
    {

    }

    procedure CBRCreateUserTask(DocType: Text[30]; DocNo: Code[20]; VAR TaskID: Integer)
    begin
        UserTask.INIT;
        UserTask.ID := GetLastID;
        UserTask.Title := FORMAT(DocType) + '-' + DocNo;
        DateValue := CALCDATE('1D', TODAY);
        UserTask."Start DateTime" := CREATEDATETIME(DateValue, TIME);
        UserTask."Due DateTime" := CREATEDATETIME(DateValue, TIME);
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

    var
        UserTaskRec: Record "User Task";
}
