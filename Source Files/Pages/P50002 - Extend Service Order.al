pageextension 50002 ExtendServiceOrder extends "Service Order"
{

    layout
    {
        addafter("Release Status")
        {
            field("Start Milage"; "Start Milage")
            {
                ApplicationArea = all;
            }
            field("Stop Milage"; "Stop Milage")
            {
                ApplicationArea = all;
            }
            field("Bill for Service"; "Bill for Service")
            {
                ApplicationArea = all;
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
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                // OZI0002 >>
                //  OnBeforePostSVO(ServHeader);
                // OZI0002 <<
            end;

        }
        addafter("&Print")
        {
            action(EMailDocument)
            {
                Caption = 'Email Order';
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
        ServHeader: Record "Service Header";



    //procedure OnBeforePostSVO(var SVOHeader: Record "Service Header")
    // var
    // //AccessControl: Record "Access Control";
    // Question: Label 'Posting Date is not equal to today, do you still want to post?';
    // Answer: Boolean;
    // begin

    // OZI0002 Commented on 04/03/2022 CBR_SS>>
    //if SVOHeader."Responsibility Center" = '' then
    //  Error('You Must fill in the Responsibility Center before you can post.');
    //CBR_SS
    //if SVOHeader."Assigned User ID" = '' then
    //   Error('You Must fill in the Assigned User ID before you can post.');

    // if SVOHeader."Posting Date" <> Today then begin
    //     AccessControl.SetRange("User Security ID", UserSecurityId);
    //     AccessControl.SetFilter("Role ID", '_SERVICEDISPATCH|_ACCOUNTING');
    //     if AccessControl.FindFirst then begin
    //         Answer := DIALOG.Confirm(Question, true);
    //         if Answer = false then
    //             Error('Posting routine has been canceled.');
    //     end else
    //         Error('You cannot post unless the posting date is todays date.');
    // end;
    // OZI0002 <<
    // end;
}