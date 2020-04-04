pageextension 50035 ExtendSalesOrder extends "Sales Order"
{
    layout
    {

    }
    actions
    {
        addbefore(Statistics)
        {
            action(OpenUserCard)
            {
                ApplicationArea = All;
                Caption = 'Open User Task Card';
                Image = Open;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'Alt+D';

                trigger OnAction()
                var
                    CBRCodeunit: Codeunit ExtendEventsCBR;
                begin

                    CBRCodeunit.OpenUserTaskPage('Sales Order', "No.");
                end;
            }
        }
    }

}
