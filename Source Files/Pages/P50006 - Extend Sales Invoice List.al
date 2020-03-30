pageextension 50006 ExtendSalesInvoiceList extends "Sales Invoice List"
{
    layout
    {
        addafter(Amount)
        {
            field("Amount Including VAT"; "Amount Including VAT")
            {
                Caption = 'Total Amount including TAX';
                ApplicationArea = All;
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