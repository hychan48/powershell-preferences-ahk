<# Prompt Configurations  #>

# $definition = (Get-Command Prompt).Definition
# $firstLine = ($definition -split '\r?\n')[1]
# Write-Host $firstLine

# not definition
# (Get-Command Prompt).ScriptBlock
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_prompts?view=powershell-7.3
# doing it this way is much faster. dont want to touch
# the prompt function unless i have to. or it will slow down shell startup
# and this implies default behavior
<# 
if($env:SSH_CLIENT) {
    # also auto appends the PS> when triggerd this way
    function Prompt { "SSH Session >" }
    # function Prompt { $env:prompt }
    
    function Prompt { "## $Env:Username@$env:COMPUTERNAME`r`n## $($executionContext.SessionState.Path.CurrentLocation)\`r`nPS $('>' * ($nestedPromptLevel + 1)) "}
} 
#>
# can also add a new line

# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_prompts?view=powershell-7.3
# (Get-Command Prompt).ScriptBlock
# default?
# "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) ";
# function Prompt { "$Env:Prompt `nPS>" }
# function Prompt { "$Default `nPS>" }
# like default default
# "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "


