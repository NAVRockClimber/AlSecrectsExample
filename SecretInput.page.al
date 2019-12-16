page 70001 "Secret Input"
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(SecretValue; _SecretValue)
                {
                    Caption = 'Please enter the access key';
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        _SecretValue: Text;

    procedure GetSecret(): Text
    begin
        exit(_SecretValue);
    end;
}