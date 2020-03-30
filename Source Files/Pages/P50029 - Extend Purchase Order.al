pageextension 50029 ExtendPurchaseOrder extends "Purchase Order"
{
    layout
    {
        addafter("Vendor Shipment No.")
        {
            field("Sent to Vendor"; "Sent to Vendor")
            {
                ApplicationArea = All;
                Caption = 'Sent to Vendor';

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