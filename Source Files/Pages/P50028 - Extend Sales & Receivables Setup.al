pageextension 50028 ExtendSalesReceivableSetup extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Appln. between Currencies")
        {
            field("Ozone Defualt Address"; "Ozone Defualt Address")
            {
                ApplicationArea = All;
                Caption = 'Ozone Defualt Address';
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