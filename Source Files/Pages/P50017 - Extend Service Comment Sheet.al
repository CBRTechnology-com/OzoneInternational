pageextension 50017 ExtendServiceCommentSheet extends "Service Comment Sheet"
{
    layout
    {
        addafter(Date)
        {
            field("Line No."; "Line No.")
            {
                ApplicationArea = All;
            }
            field(Type; Type)
            {
                ApplicationArea = All;

            }
            field("No."; "No.")
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