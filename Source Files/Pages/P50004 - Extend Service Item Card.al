pageextension 50004 ExtendServiceItemCard extends "Service Item Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Service Ledger E&ntries")
        {
            action("Service Ledger History")
            {
                ApplicationArea = Service;
                Caption = 'Service Ledger History';
                Image = ServiceLedger;
                RunObject = Page "Service Ledger History CBR";
                RunPageLink = "Service Order No." = FIELD("No.");
                RunPageView = SORTING("Service Order No.", "Service Item No. (Serviced)", "Entry Type", "Moved from Prepaid Acc.", "Posting Date", Open, Type);
                ShortCutKey = 'Ctrl+F7';
                ToolTip = 'View all the ledger entries for the service item or service order that result from posting transactions in service documents.';
            }
        }
    }

    var
        myInt: Integer;
}