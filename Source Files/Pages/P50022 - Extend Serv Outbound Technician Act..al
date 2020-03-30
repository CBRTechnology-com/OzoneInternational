pageextension 50022 ExtendServOutBoundTechAct extends "Serv Outbound Technician Act."
{
    layout
    {
        addafter("Service Orders - to Follow-up")
        {
            field("My Service Orders - All"; "My Service Orders - All")
            {
                ApplicationArea = Service;
                DrillDownPageId = "Service Orders";
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