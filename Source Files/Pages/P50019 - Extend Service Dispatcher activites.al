pageextension 50019 ExtendServDispatcherActivties extends "Service Dispatcher Activities"
{
    layout
    {
        addlast("Service Orders")
        {
            field("Unassigned Service Orders"; "Unassigned Service Orders")
            {
                ApplicationArea = All;
                DrillDownPageId = "Service Orders";

            }
            field("Service Orders - Pending"; "Service Orders - Pending")
            {
                ApplicationArea = All;
                DrillDownPageId = "Service Orders";

            }
        }
        addafter("Open Service Quotes")
        {
            cuegroup("By Date")
            {
                CaptionML = ENU = 'By Date';
                field("Service Orders - Late"; "Service Orders - Late")
                {
                    CaptionML = ENU = 'Late';
                    DrillDownPageId = "Service Orders";
                    ApplicationArea = All;
                }

                field("Service Orders - Upcoming"; "Service Orders - Upcoming")
                {
                    CaptionML = ENU = 'Upcoming';
                    DrillDownPageId = "Service Orders";
                    ApplicationArea = All;
                }
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