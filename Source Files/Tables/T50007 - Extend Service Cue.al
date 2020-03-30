tableextension 50007 ExtendServiceCue extends "Service Cue"
{
    fields
    {
        field(50000; "My Service Orders - All"; Integer)
        {

        }
        field(50005; "My Service Orders - Pending"; Integer)
        {

        }
        field(50010; "My Service Orders - In Process"; Integer)
        {

        }
        field(50015; "My Service Orders - Finished"; Integer)
        {

        }
        field(50020; "My Service Orders - Upcoming"; Integer)
        {

        }
        field(50025; "My Service Orders - Due Date"; Integer)
        {

        }
        field(50030; "My Service Orders - Late"; Integer)
        {

        }
        field(50031; "Service Orders - All"; Integer)
        {

        }
        field(50032; "Service Orders - Pending"; Integer)
        {

        }
        field(50035; "Service Orders - Upcoming"; Integer)
        {

        }
        field(50036; "Service Orders - Due Date"; Integer)
        {

        }
        field(50037; "Service Orders - Late"; Integer)
        {

        }
        field(50038; "Unassigned Service Orders"; Integer)
        {

        }
        field(50040; "Sales Orders to Ship"; Integer)
        {

        }
        field(50041; "Transfers to Ship"; Integer)
        {

        }
        field(50042; "Items in Transit"; Decimal)
        {

        }
        field(50090; "Assigned User ID Filter"; Code[20])
        {

        }
        field(50091; "Upcoming Date Filter"; Date)
        {

        }
        field(50092; "Late Date Filter"; Date)
        {

        }

    }

    var
        myInt: Integer;
}