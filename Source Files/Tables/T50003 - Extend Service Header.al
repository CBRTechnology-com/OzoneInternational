tableextension 50003 ExtendServiceHeader extends "Service Header"
{

    fields
    {
        field(50000; "Start Milage"; Decimal)
        {
            Description = 'GA02';
        }
        field(50001; "Stop Milage"; Decimal)
        {
            Description = 'GA02';
        }
        field(50005; "Bill for Service"; Boolean)
        {
            Description = 'GA09';
        }
        modify("Customer No.")
        {
            trigger OnAfterValidate()
            begin
                //GA09 - Set the "Bill for Service" value
                "Bill for Service" := Cust."Bill for Service";
            end;
        }
    }


    var
        myInt: Integer;

        Cust: Record Customer;

    trigger OnInsert()
    begin
        "Assigned User ID" := UserId;
    end;


}