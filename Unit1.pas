unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    TagLEdit1: TLabeledEdit;
    AttrLEdit1: TLabeledEdit;
    AttrLEdit2: TLabeledEdit;
    AttrLEdit3: TLabeledEdit;
    Label1: TLabel;
    Memo2: TMemo;
    Memo3: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    LabeledEdit6: TLabeledEdit;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  imgtit:string;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
CheckBox7.Checked:=true;
LabeledEdit6.Text:='highslide';
LabeledEdit5.Text:='Highslide JS';
CheckBox8.Checked:=True;
imgtit:='Щёлкните на миниатюру, чтобы увеличить изображение';
CheckBox6.Checked:=true;
CheckBox5.Checked:=true;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i:word;
ahref,atarget,arel,aclass,aeventclick,athumb:string;
imgsrc,imgwid,imghig,imgalt:string;
begin
CheckBox10.Enabled:=false;
memo1.Lines.Clear;
i:=1;
repeat
//memo1.Lines.Add('<?if($IMG_SMALL_URL'+inttostr(i)+'$)?><li><a href="$IMG_URL'+inttostr(i)+'$" class="highslide"	onclick="return hs.expand(this, config1 )"><img src="$IMG_SMALL_URL'+inttostr(i)+'$"  alt=""/></a></li><?endif?>');
if CheckBox12.Checked then AttrLEdit1.Text:='$IMG_URL'+inttostr(i)+'$';
if AttrLEdit1.Text<>'' then ahref:=AttrLEdit1.Text else ahref:=memo2.Lines[i-1];
if AttrLEdit2.Text<>'' then atarget:='target="'+AttrLEdit2.Text+'"' else atarget:='target="_self"';
if AttrLEdit3.Text<>'' then arel:='rel="'+AttrLEdit3.Text+'"' else arel:='rel="nofollow"';

if CheckBox13.Checked then LabeledEdit2.Text:='$IMG_SMALL_URL'+inttostr(i)+'$';
if LabeledEdit2.Text<>'' then imgsrc:=LabeledEdit2.Text else imgsrc:=memo3.Lines[i-1];
if LabeledEdit3.Text<>'' then imgwid:='width="'+LabeledEdit3.Text+'"' else imgwid:='width="10"';
if LabeledEdit4.Text<>'' then imghig:='height="'+LabeledEdit4.Text+'"' else imghig:='height="10"';
if LabeledEdit5.Text<>'' then imgalt:=LabeledEdit5.Text else imgalt:='';

if CheckBox3.Checked then imgwid:='';
if CheckBox4.Checked then imghig:='';
if CheckBox5.Checked then atarget:='';
if CheckBox6.Checked then arel:='';

if CheckBox7.Checked then aclass:='class="'+LabeledEdit6.Text+'" ' else aclass:='';
if CheckBox8.Checked then aeventclick:='onclick="return hs.expand(this, config1 )" ' else aeventclick:='';
if CheckBox9.Checked then athumb:='id="thumb'+inttostr(i)+'" ' else athumb:='';

if CheckBox11.Checked then memo1.Lines.Add('<?if($IMG_SMALL_URL'+inttostr(i)+'$)?>');
if CheckBox10.Checked then memo1.Lines.Add('<li>');
memo1.Lines.Add('<'+TagLEdit1.Text+' href="'+ahref+'" '+athumb+aclass+aeventclick+atarget+' '+arel+' >');
memo1.Lines.Add('<'+LabeledEdit1.Text+' src="'+imgsrc+'" '+imgwid+' '+imghig+' alt="'+imgalt+'" title="'+imgtit+'" />');
memo1.Lines.Add('</a>');
if CheckBox10.Checked then memo1.Lines.Add('</li>');
if CheckBox11.Checked then memo1.Lines.Add('<?endif?>');

i:=i+1;
until i=SpinEdit1.Value+1;
CheckBox10.Enabled:=true;
end;

procedure TForm1.CheckBox12Click(Sender: TObject);
begin
if CheckBox12.Checked then
begin
memo2.Enabled:=false;
label2.Enabled:=false;
end else begin
memo2.Enabled:=true;
label2.Enabled:=true;
end;
end;

procedure TForm1.CheckBox13Click(Sender: TObject);
begin
 if CheckBox13.Checked then
begin
memo3.Enabled:=false;
label3.Enabled:=false;
end else begin
memo3.Enabled:=true;
label3.Enabled:=true;
end;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
if CheckBox3.Checked then LabeledEdit3.Enabled:=false else LabeledEdit3.Enabled:=true;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
if CheckBox4.Checked then LabeledEdit4.Enabled:=false else LabeledEdit4.Enabled:=true;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
if CheckBox5.Checked then  AttrLEdit2.Enabled:=false else AttrLEdit2.Enabled:=true;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
if CheckBox6.Checked then  AttrLEdit3.Enabled:=false else AttrLEdit3.Enabled:=true;
end;

procedure TForm1.CheckBox7Click(Sender: TObject);
begin
if CheckBox7.Checked then LabeledEdit6.Enabled:=true else LabeledEdit6.Enabled:=false;

end;

procedure TForm1.Memo2Change(Sender: TObject);
begin
SpinEdit1.Value:=memo2.Lines.Count;
end;

end.
