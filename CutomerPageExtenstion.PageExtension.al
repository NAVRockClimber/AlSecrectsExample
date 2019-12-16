pageextension 70000 "My Demo Extension" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(ShowSecret)
            {
                Image = ShowWarning;
                Caption = 'Show Secret';
                ApplicationArea = All;

                trigger OnAction()
                var
                    SecretDemoSetup: Record "Secret Demo Setup";
                    SecretHelper: Codeunit "Secret Helper";
                    SecretValue: Text;
                begin
                    SecretDemoSetup.Get();
                    SecretValue := SecretHelper.GetSecret(SecretDemoSetup."Access Key Code");
                    Message(SecretValue);
                end;
            }
        }
    }
}