$SourceRoot = "C:\Users\kiamn\OneDrive\Fakompany\03-Endpoint-MECM-Intune\Distribution Point"
$OutputRoot = "C:\Users\kiamn\OneDrive\Fakompany\03-Endpoint-MECM-Intune\Distribution Point\Intune"
$IntuneWinTool = "C:\Users\kiamn\OneDrive\Fakompany\03-Endpoint-MECM-Intune\Distribution Point\Microsoft-Win32-Content-Prep-Tool-1.8.7\Microsoft-Win32-Content-Prep-Tool-1.8.7\IntuneWinAppUtil.exe"

Get-ChildItem -Path $SourceRoot -Directory | ForEach-Object {
	$AppFolder = $_.Fullname
	$Installer = Get-ChildItem -Path $AppFolder -File |
				 Where-Object { $_.Extension -in ".exe", ".msi" } |
				 Select-Object -First 1
	
	if ($Installer) {
		Write-Host "Packaging $($Installer.Name)..." -ForegroundColor Cyan
		
		& $IntuneWinTool `
		   -c $AppFolder `
		   -s $Installer.Name `
		   -o $OutputRoot `
		   | Out-Null
		
		Write-Host "Done: $($Installer.Name)" -ForegroundColor Green
	}
	else {
		Write-Host "No Installer found in $AppFolder" -ForegroundColor Yellow
	
	}
}