unit Unit1;

{$mode objfpc}{$H+}
{$modeswitch advancedrecords}

interface

uses
  Classes, Windows, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, HMI_Draw_Valves, HMIEdit, tcp_udpport, ISOTCPDriver, PLCBlock,
  PLCBlockElement, TagBit, Types, strutils;

function DwmGetWindowAttribute(hwnd: HWND; dwAttribute: DWORD; pvAttribute: PVOID; cbAttribute: DWORD): HRESULT; stdcall; external 'dwmapi.dll';

type
	ValveShape_ = record
		VSmall: array of TPoint;
                VSmall_Width:integer;
                VSmall_Height:integer;
		VMedium : array of TPoint;
                VMedium_Width:integer;
                VMedium_Height:integer;
		VLarge : array of TPoint;
                VLarge_Width:integer;
                VLarge_Height:integer;
		VXLarge : array of TPoint;
                VXLarge_Width:integer;
                VXLarge_Height:integer;
		HSmall: array of TPoint;
                HSmall_Width:integer;
                HSmall_Height:integer;
		HMedium : array of TPoint;
                HMedium_Width:integer;
                HMedium_Height:integer;
		HLarge : array of TPoint;
                HLarge_Width:integer;
                HLarge_Height:integer;
		HXLarge : array of TPoint;
                HXLarge_Width:integer;
                HXLarge_Height:integer;
	end;
type
	LEDShape_ = record
		Small: array of TPoint;
                Small_Width:integer;
                Small_Height:integer;
		Medium : array of TPoint;
                Medium_Width:integer;
                Medium_Height:integer;
		Large : array of TPoint;
                Large_Width:integer;
                Large_Height:integer;
		XLarge : array of TPoint;
                XLarge_Width:integer;
                XLarge_Height:integer;
	end;

type
	Valve_ = record
		Shape_: array of TPoint;
                Width_:integer;
                Height_:integer;
                Pen_Color :TColor;
                On_Color :Tcolor;
                Off_Color :Tcolor;
                Value:integer;
                OldValue:integer;
                Name:String;
                Paint:procedure of object;
                function Status: Tcolor;
        end;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DB211_DBD212: TPLCBlockElement;
    DB211_DBD216: TPLCBlockElement;
    DB_211: TPLCBlock;
    Edit1: TEdit;
    Edit2: TEdit;
    HMIEdit1: THMIEdit;
    HMIEdit2: THMIEdit;
    I13_0: TTagBit;
    I13_1: TTagBit;
    I13_2: TTagBit;
    I13_3: TTagBit;
    I13_4: TTagBit;
    I13_5: TTagBit;
    I13_6: TTagBit;
    I13_7: TTagBit;
    I15_0: TTagBit;
    I15_1: TTagBit;
    I15_2: TTagBit;
    I15_3: TTagBit;
    I15_4: TTagBit;
    I15_5: TTagBit;
    I15_6: TTagBit;
    I15_7: TTagBit;
    I78_0: TTagBit;
    I78_1: TTagBit;
    I78_2: TTagBit;
    I78_3: TTagBit;
    I78_4: TTagBit;
    I78_5: TTagBit;
    I78_6: TTagBit;
    I78_7: TTagBit;
    IB13: TPLCBlockElement;
    IB15: TPLCBlockElement;
    IB78: TPLCBlockElement;
    IB_13: TPLCBlock;
    IB_15: TPLCBlock;
    IB_78: TPLCBlock;
    ISOTCPDriver1: TISOTCPDriver;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo2: TMemo;
    PageControl1: TPageControl;
    Q48_0: TTagBit;
    Q48_1: TTagBit;
    Q48_2: TTagBit;
    Q48_3: TTagBit;
    Q48_4: TTagBit;
    Q48_5: TTagBit;
    Q48_6: TTagBit;
    Q48_7: TTagBit;
    QB48: TPLCBlockElement;
    QB_48: TPLCBlock;
    Shape1: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape2: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Shape28: TShape;
    Shape29: TShape;
    Shape3: TShape;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TCP_UDPPort1: TTCP_UDPPort;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1EditingDone(Sender: TObject);
    procedure Edit2EditingDone(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Shape11MouseEnter(Sender: TObject);
    procedure Shape11Paint(Sender: TObject);
    procedure Shape12MouseEnter(Sender: TObject);
    procedure Shape12Paint(Sender: TObject);
    procedure Shape13MouseEnter(Sender: TObject);
    procedure Shape14MouseEnter(Sender: TObject);
    procedure Shape15MouseEnter(Sender: TObject);
    procedure Shape15Paint(Sender: TObject);
    procedure Shape16MouseEnter(Sender: TObject);
    procedure Shape16Paint(Sender: TObject);
    procedure Shape19MouseEnter(Sender: TObject);
    procedure Shape19Paint(Sender: TObject);
    procedure Shape20MouseEnter(Sender: TObject);
    procedure Shape20Paint(Sender: TObject);
    procedure Shape21MouseEnter(Sender: TObject);
    procedure Shape21MouseLeave(Sender: TObject);
    procedure Shape21Paint(Sender: TObject);
    procedure Shape22MouseEnter(Sender: TObject);
    procedure Shape22Paint(Sender: TObject);
    procedure Shape23MouseEnter(Sender: TObject);
    procedure Shape23Paint(Sender: TObject);
    procedure Shape24MouseEnter(Sender: TObject);
    procedure Shape24Paint(Sender: TObject);
    procedure Shape32MouseEnter(Sender: TObject);
    procedure Shape32Paint(Sender: TObject);
    procedure Shape33MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer1Timer(Sender: TObject);
  private

  public
    UnwindSafetyUnlock:Valve_;
    UnwindSafetyLock:Valve_;
    UnwindExitRailUnlock:Valve_;
    UnwindExitRailLock:Valve_;

    LED_UnwindSafetyUnlock:Valve_;
    LED_UnwindSafetyLock:Valve_;

    LED_UnwindExitRailUnlockOS:Valve_;
    LED_UnwindExitRailLockOS:Valve_;
    LED_UnwindExitRailUnlockDS:Valve_;
    LED_UnwindExitRailLockDS:Valve_;

    LED_UnwindCompleteChuck:Valve_;

    StartTime, ElapsedTime: DWord;
    Exit_:boolean;

    Function RepairIPAddress(s: string):string;
    Function CheckDirectory(C_DNAME: string;Debug_:TMemo):boolean; //True=Error
    procedure ScreenshotToFile(const Filename: string; Monitor_: integer);
    function get_ss_of(window: hwnd; var bmp: graphics.TBitmap): integer;
    procedure Log(const s : string);
    procedure Log(Const Fmt : String; const Args : Array of const);

  end;

var
  Form1: TForm1;
  ValveShape: ValveShape_;
  LEDShape: LEDShape_;
  X_:integer;
  Y_:integer;
  ToolTip_Shape01: array of TPoint;
  ToolTip_Shape02: array of TPoint;
  ToolTip_StringXY:Tpoint;
  ToolTip_String:string;
implementation

{$R *.lfm}

{ TForm1 }
function Valve_.Status: Tcolor;
begin
  Result := clSilver;
  if Value > 0 then
    Result := clGreen
  else
    Result := clSilver; //Self.Width_ / Self.Width_;
end;

procedure InitShapeValve();
begin
  SetLength(ValveShape.VSmall, 4);
  SetLength(ValveShape.VMedium, 4);
  SetLength(ValveShape.VLarge, 4);
  SetLength(ValveShape.VXLarge, 4);

  SetLength(ValveShape.HSmall, 4);
  SetLength(ValveShape.HMedium, 4);
  SetLength(ValveShape.HLarge, 4);
  SetLength(ValveShape.HXLarge, 4);

  ValveShape.VSmall[0] := Point(0, 0);
  ValveShape.VSmall[1] := Point(10, 0);
  ValveShape.VSmall[2] := Point(0, 15);
  ValveShape.VSmall[3] := Point(10, 15);
  ValveShape.VSmall_Width:=10+1;
  ValveShape.VSmall_Height:=15+1;

  ValveShape.VMedium[0] := Point(0, 0);
  ValveShape.VMedium[1] := Point(Round(10*1.5), 0);
  ValveShape.VMedium[2] := Point(0, Round(15*1.5));
  ValveShape.VMedium[3] := Point(Round(10*1.5), Round(15*1.5));
  ValveShape.VMedium_Width:=Round(10*1.5)+1;
  ValveShape.VMedium_Height:=Round(15*1.5)+1;

  ValveShape.VLarge[0] := Point(0, 0);
  ValveShape.VLarge[1] := Point(Round(10*2), 0);
  ValveShape.VLarge[2] := Point(0, Round(15*2));
  ValveShape.VLarge[3] := Point(Round(10*2), Round(15*2));
  ValveShape.VLarge_Width:=Round(10*2)+1;
  ValveShape.VLarge_Height:=Round(15*2)+1;

  ValveShape.VXLarge[0] := Point(0, 0);
  ValveShape.VXLarge[1] := Point(Round(10*2.3), 0);
  ValveShape.VXLarge[2] := Point(0, Round(15*2.3));
  ValveShape.VXLarge[3] := Point(Round(10*2.3), Round(15*2.3));
  ValveShape.VXLarge_Width:=Round(10*2.3)+1;
  ValveShape.VXLarge_Height:=Round(15*2.3)+1;

  ValveShape.HSmall[0] := Point(0, 0);
  ValveShape.HSmall[1] := Point(15, 0);
  ValveShape.HSmall[2] := Point(0, 10);
  ValveShape.HSmall[3] := Point(15, 10);
  ValveShape.HSmall_Width:=15+1;
  ValveShape.HSmall_Height:=10+1;

  ValveShape.HMedium[0] := Point(0, 0);
  ValveShape.HMedium[1] := Point(Round(15*1.5), 0);
  ValveShape.HMedium[2] := Point(0, Round(10*1.5));
  ValveShape.HMedium[3] := Point(Round(15*1.5), Round(10*1.5));
  ValveShape.HMedium_Width:=Round(15*1.5)+1;
  ValveShape.HMedium_Height:=Round(10*1.5)+1;

  ValveShape.HLarge[0] := Point(0, 0);
  ValveShape.HLarge[1] := Point(Round(15*2), 0);
  ValveShape.HLarge[2] := Point(0, Round(10*2));
  ValveShape.HLarge[3] := Point(Round(15*2), Round(10*2));
  ValveShape.HLarge_Width:=Round(15*2)+1;
  ValveShape.HLarge_Height:=Round(10*2)+1;

  ValveShape.HXLarge[0] := Point(0, 0);
  ValveShape.HXLarge[1] := Point(Round(15*2.3), 0);
  ValveShape.HXLarge[2] := Point(0, Round(10*2.3));
  ValveShape.HXLarge[3] := Point(Round(15*2), Round(10*2.3));
  ValveShape.HXLarge_Width:=Round(15*2.3)+1;
  ValveShape.HXLarge_Height:=Round(10*2.3)+1;

  SetLength(LEDShape.Small, 4);
  SetLength(LEDShape.Medium, 4);
  SetLength(LEDShape.Large, 4);
  SetLength(LEDShape.XLarge, 4);

  LEDShape.Small[0] := Point(0, 0);
  LEDShape.Small[1] := Point(7, 0);
  LEDShape.Small[2] := Point(7, 15);
  LEDShape.Small[3] := Point(0, 15);
  LEDShape.Small_Width:=7+1;
  LEDShape.Small_Height:=15+1;

  LEDShape.Medium[0] := Point(0, 0);
  LEDShape.Medium[1] := Point(Round(7*1.5), 0);
  LEDShape.Medium[2] := Point(Round(7*1.5), Round(15*1.5));
  LEDShape.Medium[3] := Point(0, Round(15*1.5));
  LEDShape.Medium_Width:=Round(7*1.5)+1;
  LEDShape.Medium_Height:=Round(15*1.5)+1;

  LEDShape.Large[0] := Point(0, 0);
  LEDShape.Large[1] := Point(Round(7*2), 0);
  LEDShape.Large[2] := Point(Round(7*2), Round(15*2));
  LEDShape.Large[3] := Point(0, Round(15*2));
  LEDShape.Large_Width:=Round(7*2)+1;
  LEDShape.Large_Height:=Round(15*2)+1;

  LEDShape.XLarge[0] := Point(0, 0);
  LEDShape.XLarge[1] := Point(Round(7*2.3), 0);
  LEDShape.XLarge[2] := Point(Round(7*2.3), Round(15*2.3));
  LEDShape.XLarge[3] := Point(0, Round(15*2.3));
  LEDShape.XLarge_Width:=Round(7*2.3)+1;
  LEDShape.XLarge_Height:=Round(15*2.3)+1;

  Form1.UnwindSafetyUnlock.Shape_:=ValveShape.VMedium;
  Form1.UnwindSafetyUnlock.Width_:=ValveShape.VMedium_Width;
  Form1.UnwindSafetyUnlock.Height_:=ValveShape.VMedium_Height;
  Form1.UnwindSafetyUnlock.Value:=0;
  Form1.UnwindSafetyUnlock.OldValue:=Form1.UnwindSafetyUnlock.Value;
  Form1.UnwindSafetyUnlock.Pen_Color:=clBlack;
  Form1.UnwindSafetyUnlock.On_Color:=clGreen;
  Form1.UnwindSafetyUnlock.Off_Color:=clSilver;
  Form1.UnwindSafetyUnlock.Name:='Q48.2 : UnwindSafetyUnlock';

  Form1.UnwindSafetyLock.Shape_:=ValveShape.VMedium;
  Form1.UnwindSafetyLock.Width_:=ValveShape.VMedium_Width;
  Form1.UnwindSafetyLock.Height_:=ValveShape.VMedium_Height;
  Form1.UnwindSafetyLock.Value:=0;
  Form1.UnwindSafetyLock.OldValue:=Form1.UnwindSafetyLock.Value;
  Form1.UnwindSafetyLock.Pen_Color:=clBlack;
  Form1.UnwindSafetyLock.On_Color:=clGreen;
  Form1.UnwindSafetyLock.Off_Color:=clSilver;
  Form1.UnwindSafetyLock.Name:='Q48.3 : UnwindSafetyLock';

  Form1.UnwindExitRailUnlock.Shape_:=ValveShape.VMedium;
  Form1.UnwindExitRailUnlock.Width_:=ValveShape.VMedium_Width;
  Form1.UnwindExitRailUnlock.Height_:=ValveShape.VMedium_Height;
  Form1.UnwindExitRailUnlock.Value:=0;
  Form1.UnwindExitRailUnlock.OldValue:=Form1.UnwindExitRailUnlock.Value;
  Form1.UnwindExitRailUnlock.Pen_Color:=clBlack;
  Form1.UnwindExitRailUnlock.On_Color:=clGreen;
  Form1.UnwindExitRailUnlock.Off_Color:=clSilver;
  Form1.UnwindExitRailUnlock.Name:='Q48.7 : UnwindExitRailUnlock';

  Form1.UnwindExitRailLock.Shape_:=ValveShape.VMedium;
  Form1.UnwindExitRailLock.Width_:=ValveShape.VMedium_Width;
  Form1.UnwindExitRailLock.Height_:=ValveShape.VMedium_Height;
  Form1.UnwindExitRailLock.Value:=0;
  Form1.UnwindExitRailLock.OldValue:=Form1.UnwindExitRailLock.Value;
  Form1.UnwindExitRailLock.Pen_Color:=clBlack;
  Form1.UnwindExitRailLock.On_Color:=clGreen;
  Form1.UnwindExitRailLock.Off_Color:=clSilver;
  Form1.UnwindExitRailLock.Name:='Q48.6 : UnwindExitRailLock';

  Form1.LED_UnwindSafetyUnlock.Shape_:=LEDShape.Medium;
  Form1.LED_UnwindSafetyUnlock.Width_:=LEDShape.Medium_Width;
  Form1.LED_UnwindSafetyUnlock.Height_:=LEDShape.Medium_Height;
  Form1.LED_UnwindSafetyUnlock.Value:=0;
  Form1.LED_UnwindSafetyUnlock.OldValue:=Form1.LED_UnwindSafetyUnlock.Value;
  Form1.LED_UnwindSafetyUnlock.Pen_Color:=clBlack;
  Form1.LED_UnwindSafetyUnlock.On_Color:=clGreen;
  Form1.LED_UnwindSafetyUnlock.Off_Color:=clSilver;
  Form1.LED_UnwindSafetyUnlock.Name:='I15.5 : LED_UnwindSafetyUnlock';

  Form1.LED_UnwindSafetyLock.Shape_:=LEDShape.Medium;
  Form1.LED_UnwindSafetyLock.Width_:=LEDShape.Medium_Width;
  Form1.LED_UnwindSafetyLock.Height_:=LEDShape.Medium_Height;
  Form1.LED_UnwindSafetyLock.Value:=0;
  Form1.LED_UnwindSafetyLock.OldValue:=Form1.LED_UnwindSafetyLock.Value;
  Form1.LED_UnwindSafetyLock.Pen_Color:=clBlack;
  Form1.LED_UnwindSafetyLock.On_Color:=clGreen;
  Form1.LED_UnwindSafetyLock.Off_Color:=clSilver;
  Form1.LED_UnwindSafetyLock.Name:='I15.4 : LED_UnwindSafetyLock';

  Form1.LED_UnwindExitRailUnlockOS.Shape_:=LEDShape.Medium;
  Form1.LED_UnwindExitRailUnlockOS.Width_:=LEDShape.Medium_Width;
  Form1.LED_UnwindExitRailUnlockOS.Height_:=LEDShape.Medium_Height;
  Form1.LED_UnwindExitRailUnlockOS.Value:=0;
  Form1.LED_UnwindExitRailUnlockOS.OldValue:=Form1.LED_UnwindExitRailUnlockOS.Value;
  Form1.LED_UnwindExitRailUnlockOS.Pen_Color:=clBlack;
  Form1.LED_UnwindExitRailUnlockOS.On_Color:=clGreen;
  Form1.LED_UnwindExitRailUnlockOS.Off_Color:=clSilver;
  Form1.LED_UnwindExitRailUnlockOS.Name:='I78.3 : LED_UnwindExitRailUnlockOS';

  Form1.LED_UnwindExitRailLockOS.Shape_:=LEDShape.Medium;
  Form1.LED_UnwindExitRailLockOS.Width_:=LEDShape.Medium_Width;
  Form1.LED_UnwindExitRailLockOS.Height_:=LEDShape.Medium_Height;
  Form1.LED_UnwindExitRailLockOS.Value:=0;
  Form1.LED_UnwindExitRailLockOS.OldValue:=Form1.LED_UnwindExitRailLockOS.Value;
  Form1.LED_UnwindExitRailLockOS.Pen_Color:=clBlack;
  Form1.LED_UnwindExitRailLockOS.On_Color:=clGreen;
  Form1.LED_UnwindExitRailLockOS.Off_Color:=clSilver;
  Form1.LED_UnwindExitRailLockOS.Name:='I78.4 : LED_UnwindExitRailLockOS';

  Form1.LED_UnwindExitRailUnlockDS.Shape_:=LEDShape.Medium;
  Form1.LED_UnwindExitRailUnlockDS.Width_:=LEDShape.Medium_Width;
  Form1.LED_UnwindExitRailUnlockDS.Height_:=LEDShape.Medium_Height;
  Form1.LED_UnwindExitRailUnlockDS.Value:=0;
  Form1.LED_UnwindExitRailUnlockDS.OldValue:=Form1.LED_UnwindExitRailUnlockDS.Value;
  Form1.LED_UnwindExitRailUnlockDS.Pen_Color:=clBlack;
  Form1.LED_UnwindExitRailUnlockDS.On_Color:=clGreen;
  Form1.LED_UnwindExitRailUnlockDS.Off_Color:=clSilver;
  Form1.LED_UnwindExitRailUnlockDS.Name:='I13.5 : LED_UnwindExitRailUnlockDS';

  Form1.LED_UnwindExitRailLockDS.Shape_:=LEDShape.Medium;
  Form1.LED_UnwindExitRailLockDS.Width_:=LEDShape.Medium_Width;
  Form1.LED_UnwindExitRailLockDS.Height_:=LEDShape.Medium_Height;
  Form1.LED_UnwindExitRailLockDS.Value:=0;
  Form1.LED_UnwindExitRailLockDS.OldValue:=Form1.LED_UnwindExitRailLockDS.Value;
  Form1.LED_UnwindExitRailLockDS.Pen_Color:=clBlack;
  Form1.LED_UnwindExitRailLockDS.On_Color:=clGreen;
  Form1.LED_UnwindExitRailLockDS.Off_Color:=clSilver;
  Form1.LED_UnwindExitRailLockDS.Name:='I15.1 : LED_UnwindExitRailLockDS';

  Form1.LED_UnwindCompleteChuck.Shape_:=LEDShape.Medium;
  Form1.LED_UnwindCompleteChuck.Width_:=LEDShape.Medium_Width;
  Form1.LED_UnwindCompleteChuck.Height_:=LEDShape.Medium_Height;
  Form1.LED_UnwindCompleteChuck.Value:=0;
  Form1.LED_UnwindCompleteChuck.OldValue:=Form1.LED_UnwindCompleteChuck.Value;
  Form1.LED_UnwindCompleteChuck.Pen_Color:=clBlack;
  Form1.LED_UnwindCompleteChuck.On_Color:=clGreen;
  Form1.LED_UnwindCompleteChuck.Off_Color:=clSilver;
  Form1.LED_UnwindCompleteChuck.Name:='I78.7 : LED_UnwindCompleteChuck';

end;

procedure TForm1.Log(const s : string);
begin
  Memo2.Lines.Add(s);
end;

procedure TForm1.Log(const Fmt : String; const Args : array of const);
begin
  Log(Format(Fmt,Args));
end;

function TForm1.get_ss_of(window: hwnd; var bmp: graphics.TBitmap): integer;
var
  outer: TRect;
  dc: HDC;
begin
  result := 0; // 0 = success
  if not IsWindow(window) then begin Memo2.Append('Not windows'); exit(1); end;
  if not (DwmGetWindowAttribute(window, 9{DWMWA_EXTENDED_FRAME_BOUNDS}, @outer, sizeof(outer)) = S_OK) then begin Memo2.Append('Can not get window attribute'); exit(2); end;
  bmp.Width := outer.Width;
  bmp.Height := outer.Height;
  bmp.PixelFormat := pf24bit;
  dc := GetDC(GetDesktopWindow);
  bmp.BeginUpdate(true);
  if not BitBlt(bmp.Canvas.Handle, 0, 0, outer.Width, outer.Height, dc, outer.Left, outer.Top, SRCCOPY) then begin Memo2.Append('Can not copy photo'); result := 3; end;
  bmp.EndUpdate(true);
  bmp.Canvas.Changed;
  ReleaseDC(GetDesktopWindow, dc);
end;

procedure TForm1.ScreenshotToFile(const Filename: string; Monitor_: integer);
var
  BMP: Graphics.TBitmap;
  ScreenDC: HDC;
  M: TMonitor;
  W, H, X0, Y0: integer;
begin
  // Initialize coordinates of full composite area
  X0 := Screen.DesktopLeft;
  Y0 := Screen.DesktopTop;
  W  := Screen.DesktopWidth;
  H  := Screen.DesktopHeight;
  // Monitor=-1 takes entire screen, otherwise takes specified monitor
  if (Monitor_ >= 0) and (Monitor_ < Screen.MonitorCount) then begin
    M  := Screen.Monitors[Monitor_];
    X0 := M.Left;
    Y0 := M.Top;
    W  := M.Width;
    H  := M.Height;
  end;
  // prepare the bitmap
  BMP := Graphics.TBitmap.Create;
  BMP.Width  := Form1.Width;//BMP.Width  := W;
  BMP.Height  := Form1.Height; //BMP.Height := H;
  BMP.Canvas.Brush.Color := clWhite;
  BMP.Canvas.FillRect(0, 0, W, H);
  ScreenDC := GetDC(Form1.Handle); ////ScreenDC := GetDC(GetDesktopWindow);
  // copy the required area:
  BitBlt(BMP.Canvas.Handle, 0, 0, W, H, ScreenDC, X0, Y0, SRCCOPY);
  ReleaseDC(0, ScreenDC);
  // save to file (possibly to TStream, etc.)
  BMP.SaveToFile(Filename);
  BMP.Free;
end;

Function TForm1.CheckDirectory(C_DNAME: string;Debug_:TMemo):boolean; //True=Error
var
  tfOut: TextFile;
begin
  result:= false;

  if(C_DNAME<>'')then
  if Not DirectoryExists(C_DNAME) Then
  begin
    {$I-}
    //{$I-} or {$IOCHECKS OFF}
    //{$I-} rewrite (f); {$I+}
    //if IOResult<>0 then begin Writeln ('Error opening file: "file.txt"'); exit; end;
    mkdir(C_DNAME);
    {$I+}
    if IOResult<>0 then
    begin
      Debug_.Append('Directory '+C_DNAME+' error occurred. Details: '+ EInOutError.ClassName);
      ShowMessage('Cannot create '+C_DNAME+' directory. Details: '+ EInOutError.ClassName);
      result:= true;
    end;
  end;

end;

Function TForm1.RepairIPAddress(s: string):string;
var
  i:integer;
  k:integer;
  s2:string;
  c:integer;
  A_s: TStringArray;
begin

  //Edit1.Text:=chr(ord('0'));
  //Edit1.Text:=IntToStr(ord('9');

  s:=Trim(s);
  //s:=leftstr(s,15);

  s2:='';
  for i:=1 to length(s) do
  begin
    if (((ord(s[i]) >= 48) and (ord(s[i]) <= 57)) or (s[i] = '.')) then s2:=s2+s[i];
  end;
  s:=s2;

  if length(s) = 0 then s:=s+'0.0.0.0';

  if (s[1] = '.') then s:='0'+s;

  k:=0;
  for i:=1 to length(s) do
  begin
    if(s[i] = '.') then k:=k+1;
  end;
  if k=0 then s:=s+'.0.0.0';
  if k=1 then s:=s+'.0.0';
  if k=2 then s:=s+'.0';
  if s[length(s)]='.' then s:=s+'0';

  k:=0;
  c:=0;
  s2:='';
  for i:=1 to length(s) do
  begin
    if(s[i] = '.') then begin k:=k+1; c:=0; end;
    if (k>3) then
      begin
        s2:=s2;
      end
    else
      begin
        if not(s[i] = '.')then c:=c+1;
        if (c<=3) then s2:=s2+s[i];
      end;
  end;
  s:=s2;

  A_s:=SplitString(s,'.');

  k:=0;
  Try
    k:=StrToInt(A_s[0]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=IntToStr(k);

  k:=0;
  Try
    k:=StrToInt(A_s[1]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=s+'.'+IntToStr(k);

  k:=0;
  Try
    k:=StrToInt(A_s[2]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=s+'.'+IntToStr(k);

  k:=0;
  Try
    k:=StrToInt(A_s[3]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=s+'.'+IntToStr(k);

  result := s;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  InitShapeValve();

  SetLength(ToolTip_Shape01, 4);
  SetLength(ToolTip_Shape02, 3);
  ToolTip_Shape01[0] := Point(0, 0);
  ToolTip_Shape01[1] := Point(0, 0);
  ToolTip_Shape01[2] := Point(0, 0);
  ToolTip_Shape01[3] := Point(0, 0);
  ToolTip_Shape02[0] := Point(0, 0);
  ToolTip_Shape02[1] := Point(0, 0);
  ToolTip_Shape02[2] := Point(0, 0);
  ToolTip_StringXY:=Point(0, 0);
  ToolTip_String:='';

  Shape11.Pen.Color:=UnwindSafetyUnlock.Pen_Color;
  Shape11.Width:=UnwindSafetyUnlock.Width_;
  Shape11.Height:=UnwindSafetyUnlock.Height_;
  Shape11.Hint:=UnwindSafetyUnlock.Name;

  Shape12.Pen.Color:=UnwindSafetyLock.Pen_Color;
  Shape12.Width:=UnwindSafetyLock.Width_;
  Shape12.Height:=UnwindSafetyLock.Height_;
  Shape12.Hint:=UnwindSafetyLock.Name;

  Shape19.Pen.Color:=LED_UnwindSafetyUnlock.Pen_Color;
  Shape19.Width:=LED_UnwindSafetyUnlock.Width_;
  Shape19.Height:=LED_UnwindSafetyUnlock.Height_;
  Shape19.Hint:=LED_UnwindSafetyUnlock.Name;

  Shape20.Pen.Color:=LED_UnwindSafetyLock.Pen_Color;
  Shape20.Width:=LED_UnwindSafetyLock.Width_;
  Shape20.Height:=LED_UnwindSafetyLock.Height_;
  Shape20.Hint:=LED_UnwindSafetyLock.Name;

  Shape13.Pen.Color:=UnwindExitRailUnlock.Pen_Color;
  Shape13.Width:=UnwindExitRailUnlock.Width_;
  Shape13.Height:=UnwindExitRailUnlock.Height_;
  Shape13.Hint:=UnwindExitRailUnlock.Name;
  Shape15.Pen.Color:=UnwindExitRailUnlock.Pen_Color;
  Shape15.Width:=UnwindExitRailUnlock.Width_;
  Shape15.Height:=UnwindExitRailUnlock.Height_;
  Shape15.Hint:=UnwindExitRailUnlock.Name;

  Shape14.Pen.Color:=UnwindExitRailLock.Pen_Color;
  Shape14.Width:=UnwindExitRailLock.Width_;
  Shape14.Height:=UnwindExitRailLock.Height_;
  Shape14.Hint:=UnwindExitRailLock.Name;
  Shape16.Pen.Color:=UnwindExitRailLock.Pen_Color;
  Shape16.Width:=UnwindExitRailLock.Width_;
  Shape16.Height:=UnwindExitRailLock.Height_;
  Shape16.Hint:=UnwindExitRailLock.Name;

  Shape21.Pen.Color:=LED_UnwindExitRailUnlockOS.Pen_Color;
  Shape21.Width:=LED_UnwindExitRailUnlockOS.Width_;
  Shape21.Height:=LED_UnwindExitRailUnlockOS.Height_;
  Shape21.Hint:=LED_UnwindExitRailUnlockOS.Name;

  Shape22.Pen.Color:=LED_UnwindExitRailLockOS.Pen_Color;
  Shape22.Width:=LED_UnwindExitRailLockOS.Width_;
  Shape22.Height:=LED_UnwindExitRailLockOS.Height_;
  Shape22.Hint:=LED_UnwindExitRailLockOS.Name;

  Shape23.Pen.Color:=LED_UnwindExitRailUnlockDS.Pen_Color;
  Shape23.Width:=LED_UnwindExitRailUnlockDS.Width_;
  Shape23.Height:=LED_UnwindExitRailUnlockDS.Height_;
  Shape23.Hint:=LED_UnwindExitRailUnlockDS.Name;

  Shape24.Pen.Color:=LED_UnwindExitRailLockDS.Pen_Color;
  Shape24.Width:=LED_UnwindExitRailLockDS.Width_;
  Shape24.Height:=LED_UnwindExitRailLockDS.Height_;
  Shape24.Hint:=LED_UnwindExitRailLockDS.Name;

  Shape32.Pen.Color:=LED_UnwindCompleteChuck.Pen_Color;
  Shape32.Width:=LED_UnwindCompleteChuck.Width_;
  Shape32.Height:=LED_UnwindCompleteChuck.Height_;
  Shape32.Hint:=LED_UnwindCompleteChuck.Name;

  UnwindSafetyUnlock.Paint:=@Shape11.Paint;
  UnwindSafetyLock.Paint:=@Shape12.Paint;
  LED_UnwindSafetyUnlock.Paint:=@Shape19.Paint;
  LED_UnwindSafetyLock.Paint:=@Shape20.Paint;

  UnwindExitRailUnlock.Paint:=@Shape15.Paint;
  UnwindExitRailLock.Paint:=@Shape16.Paint;
  LED_UnwindExitRailUnlockOS.Paint:=@Shape23.Paint;
  LED_UnwindExitRailLockOS.Paint:=@Shape24.Paint;
  LED_UnwindExitRailUnlockDS.Paint:=@Shape21.Paint;
  LED_UnwindExitRailLockDS.Paint:=@Shape22.Paint;

  LED_UnwindCompleteChuck.Paint:=@Shape32.Paint;

  Exit_:=false;
  StartTime := GetTickCount;

end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Exit_:=true;
end;

procedure TForm1.Edit1EditingDone(Sender: TObject);
begin
  Edit1.Caption:=RepairIPAddress(Edit1.Caption);
  TCP_UDPPort1.Host:=Edit1.Caption;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

  if not TCP_UDPPort1.Active  then
  begin
    TCP_UDPPort1.EnableAutoReconnect:=true;
    TCP_UDPPort1.ExclusiveDevice:=true;
    TCP_UDPPort1.Active:=true;
    Button1.Caption:='Disconnect';
    exit;
  end;

  if TCP_UDPPort1.Active  then
  begin
    TCP_UDPPort1.EnableAutoReconnect:=false;
    TCP_UDPPort1.ExclusiveDevice:=false;
    TCP_UDPPort1.Active:=false;
    Button1.Caption:='Connect';
    exit;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Shape33.Visible:=not Shape33.Visible;
  Shape33.Refresh;
end;

procedure TForm1.Edit2EditingDone(Sender: TObject);
var
  i:integer;
begin
  i:=0;
  Try
    i:=StrToInt(Edit2.Caption);
  except
    On E : EConvertError do
      i:=102;
  end;
  Edit2.Caption:= IntToStr(i);
  TCP_UDPPort1.Port:=i;
end;

procedure TForm1.FormShow(Sender: TObject);
begin

end;

procedure TForm1.Shape11MouseEnter(Sender: TObject);
var
  StartX:integer;
  StartY:integer;
begin
  StartX:=1112;
  StartY:=210;
  ToolTip_Shape01[0] := Point(StartX-110, StartY-65);
  ToolTip_Shape01[1] := Point(StartX-100, StartY-65);
  ToolTip_Shape01[2] := Point(StartX-110, StartY-50);
  ToolTip_Shape01[3] := Point(StartX-120, StartY-50);
  ToolTip_Shape02[0] := Point(StartX, StartY);
  ToolTip_Shape02[1] := Point(StartX-35, StartY-50);
  ToolTip_Shape02[2] := Point(StartX-110, StartY-50);
  ToolTip_StringXY:=Point(StartX-95, StartY-65);
  ToolTip_String:=UnwindSafetyUnlock.Name;
  Shape33.Visible:=true;
end;

procedure TForm1.Shape11Paint(Sender: TObject);
begin
  Shape11.Canvas.Brush.Color := UnwindSafetyUnlock.Status;
  Shape11.Canvas.Polygon(UnwindSafetyUnlock.Shape_);
end;

procedure TForm1.Shape12MouseEnter(Sender: TObject);
var
  StartX:integer;
  StartY:integer;
begin
  StartX:=1112;
  StartY:=234;
  ToolTip_Shape01[0] := Point(StartX-110, StartY-65);
  ToolTip_Shape01[1] := Point(StartX-100, StartY-65);
  ToolTip_Shape01[2] := Point(StartX-110, StartY-50);
  ToolTip_Shape01[3] := Point(StartX-120, StartY-50);
  ToolTip_Shape02[0] := Point(StartX, StartY);
  ToolTip_Shape02[1] := Point(StartX-35, StartY-50);
  ToolTip_Shape02[2] := Point(StartX-110, StartY-50);
  ToolTip_StringXY:=Point(StartX-95, StartY-65);
  ToolTip_String:=UnwindSafetyLock.Name;
  Shape33.Visible:=true;
end;

procedure TForm1.Shape12Paint(Sender: TObject);
begin
  Shape12.Canvas.Brush.Color := UnwindSafetyLock.Status;
  Shape12.Canvas.Polygon(UnwindSafetyLock.Shape_);
end;

procedure TForm1.Shape13MouseEnter(Sender: TObject);
var
  StartX:integer;
  StartY:integer;
begin
  StartX:=1016;
  StartY:=200;
  ToolTip_Shape01[0] := Point(StartX-110, StartY-65);
  ToolTip_Shape01[1] := Point(StartX-100, StartY-65);
  ToolTip_Shape01[2] := Point(StartX-110, StartY-50);
  ToolTip_Shape01[3] := Point(StartX-120, StartY-50);
  ToolTip_Shape02[0] := Point(StartX, StartY);
  ToolTip_Shape02[1] := Point(StartX-35, StartY-50);
  ToolTip_Shape02[2] := Point(StartX-110, StartY-50);
  ToolTip_StringXY:=Point(StartX-95, StartY-65);
  ToolTip_String:=UnwindExitRailUnlock.Name;
  Shape33.Visible:=true;
end;

procedure TForm1.Shape14MouseEnter(Sender: TObject);
var
  StartX:integer;
  StartY:integer;
begin
  StartX:=1016;
  StartY:=222;
  ToolTip_Shape01[0] := Point(StartX-110, StartY-65);
  ToolTip_Shape01[1] := Point(StartX-100, StartY-65);
  ToolTip_Shape01[2] := Point(StartX-110, StartY-50);
  ToolTip_Shape01[3] := Point(StartX-120, StartY-50);
  ToolTip_Shape02[0] := Point(StartX, StartY);
  ToolTip_Shape02[1] := Point(StartX-35, StartY-50);
  ToolTip_Shape02[2] := Point(StartX-110, StartY-50);
  ToolTip_StringXY:=Point(StartX-95, StartY-65);
  ToolTip_String:=UnwindExitRailLock.Name;
  Shape33.Visible:=true;
end;

procedure TForm1.Shape15MouseEnter(Sender: TObject);
var
  StartX:integer;
  StartY:integer;
begin
  StartX:=30;
  StartY:=200;
  ToolTip_Shape01[0] := Point(StartX+30, StartY-65);
  ToolTip_Shape01[1] := Point(StartX+40, StartY-65);
  ToolTip_Shape01[2] := Point(StartX+30, StartY-50);
  ToolTip_Shape01[3] := Point(StartX+20, StartY-50);
  ToolTip_Shape02[0] := Point(StartX, StartY);
  ToolTip_Shape02[1] := Point(StartX+35, StartY-50);
  ToolTip_Shape02[2] := Point(StartX+110, StartY-50);
  ToolTip_StringXY:=Point(StartX+50, StartY-65);
  ToolTip_String:=UnwindExitRailUnlock.Name;
  Shape33.Visible:=true;
end;

procedure TForm1.Shape15Paint(Sender: TObject);
begin
  Shape13.Canvas.Brush.Color := UnwindExitRailUnlock.Status;
  Shape13.Canvas.Polygon(UnwindExitRailUnlock.Shape_);
  Shape15.Canvas.Brush.Color := UnwindExitRailUnlock.Status;
  Shape15.Canvas.Polygon(UnwindExitRailUnlock.Shape_);
end;

procedure TForm1.Shape16MouseEnter(Sender: TObject);
var
  StartX:integer;
  StartY:integer;
begin
  StartX:=30;
  StartY:=222;
  ToolTip_Shape01[0] := Point(StartX+30, StartY-65);
  ToolTip_Shape01[1] := Point(StartX+40, StartY-65);
  ToolTip_Shape01[2] := Point(StartX+30, StartY-50);
  ToolTip_Shape01[3] := Point(StartX+20, StartY-50);
  ToolTip_Shape02[0] := Point(StartX, StartY);
  ToolTip_Shape02[1] := Point(StartX+35, StartY-50);
  ToolTip_Shape02[2] := Point(StartX+110, StartY-50);
  ToolTip_StringXY:=Point(StartX+50, StartY-65);
  ToolTip_String:=UnwindExitRailLock.Name;
  Shape33.Visible:=true;
end;

procedure TForm1.Shape16Paint(Sender: TObject);
begin
  Shape14.Canvas.Brush.Color := UnwindExitRailLock.Status;
  Shape14.Canvas.Polygon(UnwindExitRailLock.Shape_);
  Shape16.Canvas.Brush.Color := UnwindExitRailLock.Status;
  Shape16.Canvas.Polygon(UnwindExitRailLock.Shape_);
end;

procedure TForm1.Shape19MouseEnter(Sender: TObject);
var
  StartX:integer;
  StartY:integer;
begin
  StartX:=1096;
  StartY:=210;
  ToolTip_Shape01[0] := Point(StartX-110, StartY-65);
  ToolTip_Shape01[1] := Point(StartX-100, StartY-65);
  ToolTip_Shape01[2] := Point(StartX-110, StartY-50);
  ToolTip_Shape01[3] := Point(StartX-120, StartY-50);
  ToolTip_Shape02[0] := Point(StartX, StartY);
  ToolTip_Shape02[1] := Point(StartX-35, StartY-50);
  ToolTip_Shape02[2] := Point(StartX-110, StartY-50);
  ToolTip_StringXY:=Point(StartX-95, StartY-65);
  ToolTip_String:=LED_UnwindSafetyUnlock.Name;
  Shape33.Visible:=true;
end;

procedure TForm1.Shape19Paint(Sender: TObject);
begin
  Shape19.Canvas.Brush.Color := LED_UnwindSafetyUnlock.Status;
  Shape19.Canvas.Polygon(LED_UnwindSafetyUnlock.Shape_);
end;

procedure TForm1.Shape20MouseEnter(Sender: TObject);
var
  StartX:integer;
  StartY:integer;
begin
  StartX:=1096;
  StartY:=234;
  ToolTip_Shape01[0] := Point(StartX-110, StartY-65);
  ToolTip_Shape01[1] := Point(StartX-100, StartY-65);
  ToolTip_Shape01[2] := Point(StartX-110, StartY-50);
  ToolTip_Shape01[3] := Point(StartX-120, StartY-50);
  ToolTip_Shape02[0] := Point(StartX, StartY);
  ToolTip_Shape02[1] := Point(StartX-35, StartY-50);
  ToolTip_Shape02[2] := Point(StartX-110, StartY-50);
  ToolTip_StringXY:=Point(StartX-95, StartY-65);
  ToolTip_String:=LED_UnwindSafetyLock.Name;
  Shape33.Visible:=true;
end;

procedure TForm1.Shape20Paint(Sender: TObject);
begin
  Shape20.Canvas.Brush.Color := LED_UnwindSafetyLock.Status;
  Shape20.Canvas.Polygon(LED_UnwindSafetyLock.Shape_);
end;

procedure TForm1.Shape21MouseEnter(Sender: TObject);
var
  StartX:integer;
  StartY:integer;
begin
  StartX:=50;
  StartY:=200;
  ToolTip_Shape01[0] := Point(StartX+30, StartY-65);
  ToolTip_Shape01[1] := Point(StartX+40, StartY-65);
  ToolTip_Shape01[2] := Point(StartX+30, StartY-50);
  ToolTip_Shape01[3] := Point(StartX+20, StartY-50);
  ToolTip_Shape02[0] := Point(StartX, StartY);
  ToolTip_Shape02[1] := Point(StartX+35, StartY-50);
  ToolTip_Shape02[2] := Point(StartX+110, StartY-50);
  ToolTip_StringXY:=Point(StartX+50, StartY-65);
  ToolTip_String:=LED_UnwindExitRailUnlockOS.Name;
  Shape33.Visible:=true;
end;

procedure TForm1.Shape21MouseLeave(Sender: TObject);
begin
  Shape33.Visible:=false;
end;

procedure TForm1.Shape21Paint(Sender: TObject);
begin
  Shape21.Canvas.Brush.Color := LED_UnwindExitRailUnlockOS.Status;
  Shape21.Canvas.Polygon(LED_UnwindExitRailUnlockOS.Shape_);
end;

procedure TForm1.Shape22MouseEnter(Sender: TObject);
var
  StartX:integer;
  StartY:integer;
begin
  StartX:=50;
  StartY:=222;
  ToolTip_Shape01[0] := Point(StartX+30, StartY-65);
  ToolTip_Shape01[1] := Point(StartX+40, StartY-65);
  ToolTip_Shape01[2] := Point(StartX+30, StartY-50);
  ToolTip_Shape01[3] := Point(StartX+20, StartY-50);
  ToolTip_Shape02[0] := Point(StartX, StartY);
  ToolTip_Shape02[1] := Point(StartX+35, StartY-50);
  ToolTip_Shape02[2] := Point(StartX+110, StartY-50);
  ToolTip_StringXY:=Point(StartX+50, StartY-65);
  ToolTip_String:=LED_UnwindExitRailLockOS.Name;
  Shape33.Visible:=true;
end;

procedure TForm1.Shape22Paint(Sender: TObject);
begin
  Shape22.Canvas.Brush.Color := LED_UnwindExitRailLockOS.Status;
  Shape22.Canvas.Polygon(LED_UnwindExitRailLockOS.Shape_);
end;

procedure TForm1.Shape23MouseEnter(Sender: TObject);
var
  StartX:integer;
  StartY:integer;
begin
  StartX:=992;
  StartY:=200;
  ToolTip_Shape01[0] := Point(StartX-110, StartY-65);
  ToolTip_Shape01[1] := Point(StartX-100, StartY-65);
  ToolTip_Shape01[2] := Point(StartX-110, StartY-50);
  ToolTip_Shape01[3] := Point(StartX-120, StartY-50);
  ToolTip_Shape02[0] := Point(StartX, StartY);
  ToolTip_Shape02[1] := Point(StartX-35, StartY-50);
  ToolTip_Shape02[2] := Point(StartX-110, StartY-50);
  ToolTip_StringXY:=Point(StartX-95, StartY-65);
  ToolTip_String:=LED_UnwindExitRailUnlockDS.Name;
  Shape33.Visible:=true;
end;

procedure TForm1.Shape23Paint(Sender: TObject);
begin
  Shape23.Canvas.Brush.Color := LED_UnwindExitRailUnlockDS.Status;
  Shape23.Canvas.Polygon(LED_UnwindExitRailUnlockDS.Shape_);
end;

procedure TForm1.Shape24MouseEnter(Sender: TObject);
var
  StartX:integer;
  StartY:integer;
begin
  StartX:=992;
  StartY:=222;
  ToolTip_Shape01[0] := Point(StartX-110, StartY-65);
  ToolTip_Shape01[1] := Point(StartX-100, StartY-65);
  ToolTip_Shape01[2] := Point(StartX-110, StartY-50);
  ToolTip_Shape01[3] := Point(StartX-120, StartY-50);
  ToolTip_Shape02[0] := Point(StartX, StartY);
  ToolTip_Shape02[1] := Point(StartX-35, StartY-50);
  ToolTip_Shape02[2] := Point(StartX-110, StartY-50);
  ToolTip_StringXY:=Point(StartX-95, StartY-65);
  ToolTip_String:=LED_UnwindExitRailLockDS.Name;
  Shape33.Visible:=true;
end;

procedure TForm1.Shape24Paint(Sender: TObject);
begin
  Shape24.Canvas.Brush.Color := LED_UnwindExitRailLockDS.Status;
  Shape24.Canvas.Polygon(LED_UnwindExitRailLockDS.Shape_);
end;

procedure TForm1.Shape32MouseEnter(Sender: TObject);
var
  StartX:integer;
  StartY:integer;
begin
  StartX:=64;
  StartY:=251;
  ToolTip_Shape01[0] := Point(StartX+30, StartY-65);
  ToolTip_Shape01[1] := Point(StartX+40, StartY-65);
  ToolTip_Shape01[2] := Point(StartX+30, StartY-50);
  ToolTip_Shape01[3] := Point(StartX+20, StartY-50);
  ToolTip_Shape02[0] := Point(StartX, StartY);
  ToolTip_Shape02[1] := Point(StartX+35, StartY-50);
  ToolTip_Shape02[2] := Point(StartX+110, StartY-50);
  ToolTip_StringXY:=Point(StartX+50, StartY-65);
  ToolTip_String:=LED_UnwindCompleteChuck.Name;
  Shape33.Visible:=true;
end;

procedure TForm1.Shape32Paint(Sender: TObject);
begin
  Shape32.Canvas.Brush.Color := LED_UnwindCompleteChuck.Status;
  Shape32.Canvas.Polygon(LED_UnwindCompleteChuck.Shape_);
end;

procedure TForm1.Shape33MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  X_:=X;
  Y_:=Y;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  ElapsedTime := GetTickCount - StartTime;

  Application.ProcessMessages;
  repeat
    ElapsedTime := GetTickCount - StartTime;
    if ElapsedTime>= 500 then
    begin
      UnwindSafetyUnlock.Value:=Round(Q48_2.Value);
      UnwindSafetyLock.Value:=Round(Q48_3.Value);
      LED_UnwindSafetyUnlock.Value:=Round(I15_5.Value);
      LED_UnwindSafetyLock.Value:=Round(I15_4.Value);

      UnwindExitRailUnlock.Value:=Round(Q48_7.Value);
      UnwindExitRailLock.Value:=Round(Q48_6.Value);
      LED_UnwindExitRailUnlockOS.Value:=Round(I78_3.Value);
      LED_UnwindExitRailLockOS.Value:=Round(I78_4.Value);
      LED_UnwindExitRailUnlockDS.Value:=Round(I13_5.Value);
      LED_UnwindExitRailLockDS.Value:=Round(I15_1.Value);

      LED_UnwindCompleteChuck.Value:=Round(I78_7.Value);

      //if (UnwindExitRailLock.Value=0) then UnwindExitRailLock.Value:=1 else UnwindExitRailLock.Value:=0;
      //if (Q48_7.Value=0) then Q48_7.Value:=1 else Q48_7.Value:=0;

      UnwindSafetyUnlock.Paint;
      UnwindSafetyLock.Paint;
      LED_UnwindSafetyUnlock.Paint;
      LED_UnwindSafetyLock.Paint;

      UnwindExitRailUnlock.Paint;
      UnwindExitRailLock.Paint;
      LED_UnwindExitRailUnlockOS.Paint;
      LED_UnwindExitRailLockOS.Paint;
      LED_UnwindExitRailUnlockDS.Paint;
      LED_UnwindExitRailLockDS.Paint;

      LED_UnwindCompleteChuck.Paint;


      if (Shape33.Visible) then
      begin
        Shape33.Refresh;
        Shape33.Canvas.Brush.Color := clGreen;
        Shape33.Canvas.Polygon(ToolTip_Shape01);
        Shape33.Canvas.Polyline(ToolTip_Shape02);
        Shape33.Canvas.Brush.Color := clNone;
        //Shape33.Canvas.TextOut(30,30,X_.ToString+':'+Y_.ToString);
        Shape33.Canvas.TextOut(ToolTip_StringXY.X,ToolTip_StringXY.Y,ToolTip_String);
      end;

      StartTime := GetTickCount;
    end;
    Application.ProcessMessages;
  until Exit_ = true;
end;

end.

