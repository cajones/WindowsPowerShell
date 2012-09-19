$profileDir = "$env:UserProfile\Documents\WindowsPowerShell\"
$hosts = "$env:windir\System32\drivers\etc\hosts";

#Functions
function Execute-Each($list) {
    $list |% { & $exe $_ }
}

function Edit-UsingSublimeText2($path) {
    $exe = "C:\Program Files\Sublime Text 2\sublime_text.exe" 
    $files = @()
    $files += $path
    $files += $input 
    (Execute-Each  $files)
}

function Git-Init($project, $username = 'ChrisJones0099') {
    Goto-Projects
    md $project
    cd $project
    git init
    ni -t f readme.md
    git add .
    git commit -m "first commit"
    git remote add origin git@github.com:$username/$project.git
    git push -u origin master
    Write-Host "$project has been created and pushed to github."
    start "https://github.com/$username/$project"
}

#Local scripts
. $ProfileDir\StringMan.ps1
. $ProfileDir\GotoProjects.ps1
. $ProfileDir\Find.ps1
. "C:\Program Files (x86)\posh-git\profile.example.ps1"

#Aliases
Set-Alias -Name subl -Value Edit-UsingSublimeText2
Set-Alias -Name go -Value Goto-Projects
Set-Alias -Name fs -Value Find-Solution