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
            field("Ordered for"; "Ordered for")
            {
                ApplicationArea = All;
                Caption = 'Ordered for';
            }
            field("Package Tracking No."; "Package Tracking No.")
            {
                ApplicationArea = All;
                Caption = 'Package Tracking No.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here

        addafter(Dimensions)
        {
            action(TrackPackage)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Track Package';
                Image = ItemTracking;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;
                ShortCutKey = 'Alt+D';
                ToolTip = 'Track the order based upon the tracking number entered on the purchase order document';

                trigger OnAction()
                begin
                    StartTrackingSite("Package Tracking No.");

                end;
            }


        }
    }
    local procedure OpenTrackingURL()
    var
        myInt: Integer;
    begin

    end;

    var
        myInt: Integer;
}