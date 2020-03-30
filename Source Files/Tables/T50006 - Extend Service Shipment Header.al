tableextension 50006 ExtendServiceShipmentHeader extends "Service Shipment Header"
{
    fields
    {
        field(50000; "Start Milage"; Decimal)
        {
            Description = 'GA02';
        }
        field(50001; "Stop Milage"; Decimal)
        {
            Description = 'GA02';
        }
    }

    var
        myInt: Integer;
}