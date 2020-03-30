pageextension 50018 ExtendPostdServShptLines extends "Posted Service Shipment Lines"
{
    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("Document No."; "Document No.")
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