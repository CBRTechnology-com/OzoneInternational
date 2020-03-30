tableextension 50005 ExtendServiceOrderAllocation extends "Service Order Allocation"
{
    fields
    {
        field(50000; "Responsibility Center"; Code[20])
        {
            Description = 'AP//01/20/2016';
        }
    }

    var
        myInt: Integer;
}