pageextension 50014 ExtendPostedServiceShipments extends "Posted Service Shipments"
{
    layout
    {
        addafter("Service Time (Hours)")
        {
            field("Order No."; "Order No.")
            {
                ApplicationArea = all;
            }
            field("Responsibility Center"; "Responsibility Center")
            {
                ApplicationArea = all;
            }

        }
        modify("Order Date")
        {
            Visible = true;
            ApplicationArea = All;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}