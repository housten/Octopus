$ErrorActionPreference = "Stop";
# Define working variables
$octopusURL = "https://solidifyheidi.octopus.app"
$octopusAPIKey = "API-PUTYOURKEYHERE"
$header = @{ "X-Octopus-ApiKey" = $octopusAPIKey }

# Specify the Space to search in
$spaceId = "Spaces-1"

# Variable name to search for
$VariableName = "Variable1"

# New variable value to set
$VariableValue = "auto"

# Get variable set from Octopus
# library url
$LibraryVariableSetVariables = (Invoke-RestMethod -Method Get -Uri "$OctopusURL/api/$spaceId/variables/variableset-LibraryVariableSets-21" -Headers $Header) 
# project url
#$LibraryVariableSetVariables = (Invoke-RestMethod -Method Get -Uri "$OctopusURL/api/$spaceId/variables/variableset-Projects-1" -Headers $Header) 


# Find the variable
$index = $LibraryVariableSetVariables.Variables.name.IndexOf($variableName)

 
if ($index -ge 0) {
  # if the variable was found, update it.
  $LibraryVariableSetVariables.Variables[$index].value = $variableValue
  $UpdatedLibraryVariableSet = Invoke-RestMethod -Method Put -Uri "$OctopusURL/api/$spaceId/variables/variableset-Projects-1" -Headers $Header -Body ($LibraryVariableSetVariables | ConvertTo-Json -Depth 10)   
} else {
  # Otherwise write out an error
  Write-Output ("Variable name [$variableName] not found. These are the available variable names:[{0}]" -f (($LibraryVariableSetVariables.Variables.name) -join(',')))
}

# Write out response from update
write-host ($UpdatedLibraryVariableSet | convertto-json )
