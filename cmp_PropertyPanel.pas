unit cmp_PropertyPanel;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Samples.Spin;

type
  // Property Panel
  TPropertyPanel = class(TPanel)
  private
    f_Label: TLabel;
    f_TextProperty: TEdit;
    f_CheckBoxProperty: TCheckBox;
    f_SpinProperty: TSpinEdit;

    function GetPropertyLabel(): string;
    function GetPropertyValue(): string;
    procedure SetPropertyLabel(const a_Value: string);
    procedure SetPropertyValue(const a_Value: string);
  public
    constructor Create(AOwner: TComponent; const a_Label: string); reintroduce;
    destructor Destroy; override;

    procedure SetTextProperty(const a_Value: string);
    procedure SetCheckBoxProperty(const a_Value: Boolean);
    procedure SetSpinProperty(const a_Value: Integer);

    property PropertyLabel: string read GetPropertyLabel write SetPropertyLabel;
    property PropertyValue: string read GetPropertyValue write SetPropertyValue;
  end;

implementation

// *****************************************************************************
// Constructor
constructor TPropertyPanel.Create(AOwner: TComponent; const a_Label: string);
begin
  inherited Create(AOwner);

  // Self Settings
  Self.Caption := '';
  Self.Align := alTop;
  Self.AlignWithMargins := True;
  Self.Margins.SetBounds(5, 5, 5, 5);
  Self.Padding.SetBounds(5, 0, 0, 0);
  Self.Height := 25;

  // Create Label
  f_Label := TLabel.Create(Self);

  // Label Settings
  f_Label.Align := alLeft;
  f_Label.AutoSize := False;
  f_Label.Width := 100;
  f_Label.Layout := tlCenter;
  f_Label.Caption := a_Label;
  f_Label.Parent := Self;
end;

// *****************************************************************************
// Destructor
destructor TPropertyPanel.Destroy;
begin
  inherited;
end;

// *****************************************************************************
// Text Property
procedure TPropertyPanel.SetTextProperty(const a_Value: string);
begin
  // Create Text Property Value
  f_TextProperty := TEdit.Create(Self);

  // Text Settings
  f_TextProperty.Align := alClient;
  f_TextProperty.Text := a_Value;
  f_TextProperty.Parent := Self;
end;

// *****************************************************************************
// CheckBox Property
procedure TPropertyPanel.SetCheckBoxProperty(const a_Value: Boolean);
begin
  // Create CheckBox Property Value
  f_CheckBoxProperty := TCheckBox.Create(Self);

  // CheckBox Settings
  f_CheckBoxProperty.Align := alClient;
  f_CheckBoxProperty.Checked := a_Value;
  f_CheckBoxProperty.Caption := '';
  f_CheckBoxProperty.Cursor := crHandPoint;
  f_CheckBoxProperty.Parent := Self;
end;

// *****************************************************************************
// Spin Property
procedure TPropertyPanel.SetSpinProperty(const a_Value: Integer);
begin
  // Create Spin Property Value
  f_SpinProperty := TSpinEdit.Create(Self);

  // Spin Settings
  f_SpinProperty.Align := alClient;
  f_SpinProperty.Value := a_Value;
  f_SpinProperty.Parent := Self;
end;

// *****************************************************************************
// Label Getter
function TPropertyPanel.GetPropertyLabel: string;
begin
  Result := f_Label.Caption;
end;

// *****************************************************************************
// Value Getter
function TPropertyPanel.GetPropertyValue: string;
begin
  Result := f_TextProperty.Text;
end;

// *****************************************************************************
// Label Setter
procedure TPropertyPanel.SetPropertyLabel(const a_Value: string);
begin
  f_Label.Caption := a_Value;
end;

// *****************************************************************************
// Value Setter
procedure TPropertyPanel.SetPropertyValue(const a_Value: string);
begin
  f_TextProperty.Text := a_Value;
end;

end.
