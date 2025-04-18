; DiskAnalyserSetup.iss - med automatisk oppdatering av programmet

#define MyAppName "DiskAnalyser"
#define MyAppExeName "filanalyse_gui.exe"
#define MyAppUpdater "oppdaterer.exe"
#define MyAppVersion "1.0"
#define MyAppPublisher "Viljar Bakke Nesse"
#define MyAppURL "https://github.com/vbnfpv/diskanalyser-oppdateringer"

[Setup]
AppId={{YOUR-GUID-HER}} ; kan genereres i IDE Tools > Generate GUID
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=.
OutputBaseFilename=DiskAnalyserSetup
SetupIconFile=filanalyse.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest


[Languages]
Name: "norwegian"; MessagesFile: "compiler:Languages\Norwegian.isl"

[Files]
Source: "dist\filanalyse_gui.exe";   DestDir: "{app}"; Flags: ignoreversion
Source: "dist\oppdaterer.exe";      DestDir: "{app}"; Flags: ignoreversion
Source: "dist\versjon.txt";         DestDir: "{app}"; Flags: ignoreversion
Source: "filanalyse.ico";           DestDir: "{app}"; Flags: ignoreversion
Source: "dist\åpne_logg_gui.exe"; DestDir: "{app}"; Flags: ignoreversion


[Tasks]
Name: "desktopicon"; Description: "Lag snarvei på skrivebordet"; GroupDescription: "Snarveier:"; Flags: unchecked

[Icons]
Name: "{group}\DiskAnalyser"; Filename: "{app}\oppdaterer.exe"
Name: "{group}\DiskAnalyser (Kjør direkte)"; Filename: "{app}\filanalyse_gui.exe"
Name: "{userdesktop}\DiskAnalyser"; Filename: "{app}\oppdaterer.exe"; Tasks: desktopicon
Name: "{group}\Åpne loggmappen"; Filename: "{app}\åpne_logg_gui.exe"



[Run]
; Kør oppdaterer som sjekker og starter programmet etter installasjon
Filename: "{app}\{#MyAppUpdater}"; Description: "Start og sjekk etter oppdateringer"; Flags: nowait postinstall skipifsilent


