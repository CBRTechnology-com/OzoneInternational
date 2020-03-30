tableextension 50011 ExtendSalesReceivablesSetup extends "Sales & Receivables Setup"
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