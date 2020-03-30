pageextension 50027 ExtendPurchPayablesSetup extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Calc. Inv. Disc. per VAT ID")
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