pageextension 50013 ExtendServiceLedgerEntries extends "Service Ledger Entries"
{
    layout
    {
        addafter("Dimension Set ID")
        {
            field("Responsibility Center"; "Responsibility Center")
            {
                ApplicationArea = all;
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