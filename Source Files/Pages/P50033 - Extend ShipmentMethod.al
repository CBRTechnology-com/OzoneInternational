pageextension 50033 ExtendShipmentMethod extends "Shipment Methods"
{
    layout
    {
        addafter(Description)
        {
            field("Service Name"; "Service Name")
            {
                ApplicationArea = All;
                Caption = 'Service Name';

            }
            field("Internet Address"; "Internet Address")
            {
                ApplicationArea = All;
                Caption = 'Internet Address';
            }
        }

    }
    var
        myInt: Integer;
}