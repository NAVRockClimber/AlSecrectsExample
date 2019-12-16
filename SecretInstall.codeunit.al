codeunit 70000 "Secret Installer"
{
    Subtype = Install;

    var
        FunctionUrlLbl: Label 'https://secrets-demo.azurewebsites.net/api/Project/GAEB/echo', Locked = true;

    trigger OnInstallAppPerCompany()
    begin
        CreateSetup();
    end;

    local procedure CreateSetup()
    var
        SecretDemoSetup: Record "Secret Demo Setup";
    begin
        SecretDemoSetup.Init();
        SecretDemoSetup."Function URL" := FunctionUrlLbl;
        SecretDemoSetup."Access Key Code" := 'AccessKey';
        SecretDemoSetup.Insert()
    end;
}