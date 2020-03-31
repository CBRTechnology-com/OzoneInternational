tableextension 50016 ExtendShipmentMethodCode extends "Shipment Method"
{
    Caption = 'Extend Shipment Method Code';


    fields
    {
        field(50000; "Service Name"; Code[20])
        {
            Caption = 'Service Name';

        }
        field(50001; "Internet Address"; Text[250])
        {
            Caption = 'Internet Address';

        }
    }

}
