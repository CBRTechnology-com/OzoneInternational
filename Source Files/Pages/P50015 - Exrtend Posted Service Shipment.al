pageextension 50015 ExtendPostedServiceShipment extends "Posted Service Shipment"
{
    layout
    {
        addafter("No. Printed")
        {
            field("Start Milage"; "Start Milage")
            {
                ApplicationArea = all;
            }
            field("Stop Milage"; "Stop Milage")
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