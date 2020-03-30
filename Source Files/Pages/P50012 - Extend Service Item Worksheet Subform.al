pageextension 50012 ExtendServiceItemWorkSubform extends "Service Item Worksheet Subform"
{
    layout
    {
        addafter("ShortcutDimCode[8]")
        {
            field("Unit Cost"; "Unit Cost")
            {
                ApplicationArea = all;
                Editable = true;
            }
            field("Manufacturer Item No."; "Manufacturer Item No.")
            {
                ApplicationArea = all;
            }
            field("Vendor Item No."; "Vendor Item No.")
            {
                ApplicationArea = all;
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