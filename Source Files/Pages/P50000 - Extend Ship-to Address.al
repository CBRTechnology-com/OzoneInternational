pageextension 50000 ExtendShiptoAddress extends "Ship-to Address"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        Customer: Record Customer;
    begin
        if Customer.GET(GetFilterCustNo) then begin
            "Tax Liable" := Customer."Tax Liable";
            "Tax Area Code" := Customer."Tax Area Code";
        end;
    end;

}