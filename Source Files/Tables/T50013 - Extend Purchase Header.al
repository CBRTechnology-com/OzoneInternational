tableextension 50013 ExtendPurchaseHeader extends "Purchase Header"
{
    fields
    {
        field(50003; "Sent to Vendor"; Boolean)
        {
            Caption = 'Sent to Vendor';
            Editable = false;
        }
    }

    var
        myInt: Integer;
}