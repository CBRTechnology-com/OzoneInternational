tableextension 50014 ExtendRequisitionLine extends "Requisition Line"
{
    fields
    {
        field(50000; "Source Document Type"; Option)
        {
            OptionMembers = "","Transfer Order","Sales Order","Production Order","Assembly Order";
            OptionCaption = ' ,Transfer Order,Sales Order,Production Order,Assembly Order';
        }
        field(50004; "Ordered for"; Text[50])
        {
            Caption = 'Ordered for';
        }
    }

    var
        myInt: Integer;
}