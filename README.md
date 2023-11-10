# Octopus
For Octopus Deploy related stuff

## OD_update_libraryset_variable.ps1
Script to update a variable in a global library or a project variable set.
  - the url to a global variable library is in the browser url box when you browse to it. The identifier should be preceded with "variableset-" like this: `$OctopusURL/api/$spaceId/variables/variableset-LibraryVariableSets-21`
  - the url path for a project library looks like `$OctopusURL/api/$spaceId/variables/variableset-Projects-1` and you can it find here:
    - going to the project variables page
    - click on the three vertical dots to the top right
    - right click the export to json link and copy the url.
## OD_   
