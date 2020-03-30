pageextension 50020 ExtendServiceContract extends "Service Contracts"
{
    layout
    {
        addafter("Next Price Update Date")
        {
            field("Service Period"; "Service Period")
            {
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