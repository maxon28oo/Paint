unit paint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, ColorGrd, Menus;

type
  TForm1 = class(TForm)
    Box: TPaintBox;
    Button1: TButton;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    ColorGrid1: TColorGrid;
    Button2: TButton;
    Panel1: TPanel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure ColorGrid1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BoxPaint(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  St: integer;
  clr,dr,uned,clch: boolean;
  lx,ly:integer;
  BMCopy: TBitMap;
implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  st:=1;
  Panel1.Visible:=False;
  uned:=false;  clch:=false;

  BMCopy:=TBitMap.Create;
  BMCopy.Height:=Box.Height;
  BMCopy.Width:=Box.Width;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Label4.Caption:=inttostr(TrackBar1.Position)+' '+inttostr(TrackBar2.Position)+' '+inttostr(TrackBar3.Position);
  Label5.Caption:=inttostr(Box.Canvas.Pen.Color)+' '+inttostr(Box.Canvas.Pen.Color shr 8)+' '+inttostr(Box.Canvas.Pen.Color shr 16);
  Case st of
    1: begin clr:=true; end;
  end;
  if (clr) then begin
    Shape1.Brush.Color:=Box.Canvas.Pen.Color;
    Box.Canvas.Pen.Color:=clWhite;
    Box.Canvas.Brush.Color:=clWhite;
    Box.Canvas.Rectangle(0,0,Box.Width,Box.Height);
    Box.Canvas.Pen.Color:=Shape1.Brush.Color;
    Box.Canvas.Brush.Color:=clBtnFace;
    clr:=false;
    st:=0;
  end
  else if (Panel1.Visible) then begin
    Shape1.Brush.Color:=Box.Canvas.Pen.Color;
  end;


end;

procedure TForm1.BoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (not uned) then begin Dr:=True;
  lx:=X; ly:=Y;
  end;
end;

procedure TForm1.BoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (not uned) then begin BMCopy.Canvas.CopyRect(Rect(0,0,Box.Width,Box.Height),Box.Canvas,Rect(0,0,Box.Width,Box.Height));
  Dr:=False;    end;
end;

procedure TForm1.BoxMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  StatusBar1.Panels[0].Text:=inttostr(X)+' '+inttostr(Y);
  if (dr) then begin

    Box.Canvas.MoveTo(lx,ly);
    Box.Canvas.LineTo(X,Y);
    lx:=X; ly:=Y;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  st:=1;
end;

procedure TForm1.ColorGrid1Change(Sender: TObject);
begin
  Box.Canvas.Pen.Color:=ColorGrid1.ForegroundColor;

  clch:=true;

  TrackBar1.Position:=Box.Canvas.Pen.Color;
  TrackBar2.Position:=Box.Canvas.Pen.Color shr 8;
  TrackBar3.Position:=Box.Canvas.Pen.Color shr 16;
  clch:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Panel1.Visible:=not Panel1.Visible;
  uned:=not uned;
  Button1.Enabled:=not Button1.Enabled;
end;

procedure TForm1.BoxPaint(Sender: TObject);
begin
  Box.Canvas.Draw(0,0,BMCopy);
end;

procedure TForm1.TrackBar3Change(Sender: TObject);
begin
  //Box.Canvas.Pen.Color:=(Box.Canvas.Pen.Color)+(Box.Canvas.Pen.Color)shr 8 +(TrackBar3.Position)shr 16;
  if (Panel1.Visible) and (not clch) then begin Box.Canvas.Pen.Color:=RGB(Box.Canvas.Pen.Color,Box.Canvas.Pen.Color shr 8,TrackBar3.Position);
    end;
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
  //Box.Canvas.Pen.Color:=(Box.Canvas.Pen.Color)+(TrackBar2.Position)shr 8 +(Box.Canvas.Pen.Color)shr 16;
  if (Panel1.Visible) and (not clch) then begin Box.Canvas.Pen.Color:=RGB(Box.Canvas.Pen.Color,TrackBar2.Position,Box.Canvas.Pen.Color shr 16);
  end;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  //Box.Canvas.Pen.Color:=(TrackBar1.Position)+(Box.Canvas.Pen.Color)shr 8 +(Box.Canvas.Pen.Color)shr 16;
  if (Panel1.Visible) and (not clch) then begin Box.Canvas.Pen.Color:=RGB(TrackBar1.Position,Box.Canvas.Pen.Color shr 8,Box.Canvas.Pen.Color shr 16);
 end;
end;

end.
