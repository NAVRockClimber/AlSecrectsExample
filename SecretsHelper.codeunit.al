codeunit 70001 "Secret Helper"
{
    Access = Internal;

    [NonDebuggable]
    procedure SaveSecret(KeyName: Text; SecretValue: Text)
    var
        EncryptionErr: Label 'The secret cannot be stored. The encryption is not enabled.';
        EncrytedBuffer: Text;
    begin
        if not EncryptionEnabled() then begin
            Error(EncryptionErr);
        end;
        EncrytedBuffer := Encrypt(SecretValue);
        IsolatedStorage.Set(KeyName, EncrytedBuffer, DataScope::Module);
    end;

    [NonDebuggable]
    procedure GetSecret(KeyName: Text): Text
    var
        SecretValue: Text;
        PlainBuffer: Text;
    begin
        if IsolatedStorage.Contains(KeyName, DataScope::Module) then begin
            if IsolatedStorage.Get(KeyName, DataScope::Module, SecretValue) then begin
                if EncryptionEnabled() then begin
                    PlainBuffer := Decrypt(SecretValue);
                    exit(PlainBuffer);
                end;
            end;
        end;
    end;

    [NonDebuggable]
    procedure DeleteSecret(KeyName: Text)
    begin
        IsolatedStorage.Delete(KeyName, DataScope::Module);
    end;

    [NonDebuggable]
    procedure UpdateSecret()
    var
        SecretDemoSetup: Record "Secret Demo Setup";
        SecretInput: Page "Secret Input";
        SecretValue: Text;
    begin
        SecretDemoSetup.Get();
        SecretDemoSetup.Testfield("Function URL");
        SecretDemoSetup.TestField("Access Key Code");
        if SecretInput.RunModal() = Action::OK then begin
            SecretValue := SecretInput.GetSecret();
            SaveSecret(SecretDemoSetup."Access Key Code", SecretValue);
        end;
    end;
}