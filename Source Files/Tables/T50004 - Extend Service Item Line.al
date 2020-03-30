tableextension 50004 ExtendServiceItemLine extends "Service Item Line"
{
    fields
    {
        field(50000; "Item Cat. Code"; Code[20])
        {
            Description = 'OZI0001';
        }
        field(50001; "Product Group Code"; Code[20])
        {
            Description = 'OZI0001';
        }
        field(80001; Signature; Blob)
        {

        }

    }

    var
        myInt: Integer;
}