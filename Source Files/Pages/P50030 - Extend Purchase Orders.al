pageextension 50030 ExtendPurchaseOrders extends "Purchase Order List"
{
    layout
    {
        addafter(Status)
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