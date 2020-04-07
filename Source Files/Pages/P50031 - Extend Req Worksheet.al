pageextension 50031 ExtendReqWorksheet extends "Req. Worksheet"
{
    layout
    {
        addafter(Description)
        {
            field("Source Document Type"; "Source Document Type")
            {
                ApplicationArea = All;
                Visible = false;

            }
            field("Ordered for"; "Ordered for")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addbefore(CalculatePlan)
        {
            action(Copyalues)
            {
                ApplicationArea = Planning;
                Caption = 'Fill Down';
                Ellipsis = true;
                Image = CopyCosttoGLBudget;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    CopyLineValues();
                end;
            }
        }

    }
    local procedure MyProcedure()
    var
        myInt: Integer;
    begin

    end;

    procedure CopyLineValues()
    var
        CopyRecLine: Record "Requisition Line";
    begin
        IF "Ordered for" <> '' THEN BEGIN
            CopyRecLine.RESET;
            CopyRecLine.SETRANGE("Worksheet Template Name", "Worksheet Template Name");
            CopyRecLine.SETRANGE("Journal Batch Name", "Journal Batch Name");
            IF CopyRecLine.FIND('-') THEN BEGIN
                REPEAT
                    CopyRecLine."Ordered for" := "Ordered for";
                    CopyRecLine.MODIFY;
                UNTIL CopyRecLine.NEXT = 0;
                MESSAGE('Requestion worksheet for field "Ordered for" have been updated sucessfully');
            END;
        END ELSE
            TESTFIELD("Ordered for")
    end;



    var
        myInt: Integer;
}