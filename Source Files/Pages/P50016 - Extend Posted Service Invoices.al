pageextension 50016 ExtendPostedServiceInvoices extends "Posted Service Invoices"
{
    layout
    {
        modify("Currency Code")
        {
            ApplicationArea = All;
            Visible = false;
        }
        modify("Electronic Document Status")
        {
            ApplicationArea = All;
            Visible = false;
        }

        addafter("Document Exchange Status")
        {
            field("Order Date"; "Order Date")
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
        addafter("&Print")
        {
            action(EMailDocument)
            {
                Caption = 'Email Invoice';
                Promoted = true;
                PromotedIsBig = true;
                Image = Email;
                PromotedCategory = Process;
                ApplicationArea = all;
            }
        }
    }

    var
        myInt: Integer;
}