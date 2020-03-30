pageextension 50003 ExtendServiceOrders extends "Service Orders"
{
    layout
    {
        addafter("Location Code")
        {
            field("Responsibility Center"; "Responsibility Center")
            {
                ApplicationArea = All;
            }
        }
        addafter("Service Time (Hours)")
        {
            field(Description; Description)
            {
                ApplicationArea = All;
            }
        }
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