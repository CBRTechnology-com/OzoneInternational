tableextension 50012 ExtendPurchPayablesSetup extends "Purchases & Payables Setup"
{
    fields
    {
        field(50000; "Ozone Defualt Address"; Text[250])
        {
            Caption = 'Ozone Default Address';
        }
    }

    var
        myInt: Integer;
}