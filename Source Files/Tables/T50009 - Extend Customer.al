tableextension 50009 ExtendCustomer extends Customer
{
    fields
    {
        field(50005; "Bill for Service"; Boolean)
        {
            Description = 'GA09';
        }
        field(50006; "FinPac Contract No."; Code[20])
        {
            Caption = 'FinPac Contract No.';
        }
    }

    var
        myInt: Integer;
}