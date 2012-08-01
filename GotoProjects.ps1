function Goto-Projects {
    param($project)

    if((Test-Path C:\Projects\$project)) {
        Set-Location C:\Projects\$project    
    } else {
        Write-Warning "Could not find project" 
        Set-Location C:\Projects\
    }
}

if(-not (Test-Path Function:\\GotoProjectsTabExpansionBackup)) {
    Rename-Item Function:\\TabExpansion GotoProjectsTabExpansionBackup
}

function TabExpansion($line, $lastWord) {

    switch -regex ($line) {

       '(go|go-projects)' { return (ls c:\projects\) | where { $_.Name -match "^$lastWord" } |% { $_.Name } }
        
       # Fall back on existing tab expansion
       default { GotoProjectsTabExpansionBackup $line $lastWord }
    }    
}