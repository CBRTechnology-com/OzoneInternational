pageextension 50026 ExtendCustomerList extends "Customer List"
{
    layout
    {
        addafter("Phone No.")
        {
            field("FinPac Contract No."; "FinPac Contract No.")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        modify(ReportCustomerBalanceToDate)
        {
            Visible = false;
        }
        addafter(BackgroundStatement)
        {
            action(ReportCustomerBalanceToDateCBR)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customer - Balance to Date';
                Image = "Report";
                RunObject = Report "Customer - Balance to Date CBR";
                ToolTip = 'View a list with customers'' payment history up until a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.';
            }
        }
    }

    var
        myInt: Integer;
}