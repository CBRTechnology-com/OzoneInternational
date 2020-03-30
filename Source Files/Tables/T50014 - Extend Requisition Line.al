tableextension 50014 ExtendRequisitionLine extends "Requisition Line"
{
    fields
    {
        field(50000; "Source Document Type"; Option)
        {
            OptionMembers = "","Transfer Order","Sales Order","Production Order","Assembly Order";
            OptionCaption = ' ,Transfer Order,Sales Order,Production Order,Assembly Order';
        }
    }

    var
        myInt: Integer;
}