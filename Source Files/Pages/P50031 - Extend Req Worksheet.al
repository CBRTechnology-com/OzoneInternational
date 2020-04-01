pageextension 50031 ExtendReqWorksheet extends "Req. Worksheet"
{
    layout
    {
        addafter(Description)
        {
            field("Source Document Type"; "Source Document Type")
            {
                ApplicationArea = All;
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
    }

    var
        myInt: Integer;
}