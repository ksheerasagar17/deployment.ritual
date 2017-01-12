function UpdateConfigurationSettings([string]$filepath)
{
  #Will search for application and web config files in the path specified.
  Write-Output("Searching for app.config and web.config files in " + $filepath)
  $fileNames = Get-ChildItem -Path $filepath -Recurse -Include 'web.config','App.config'
  Write-Output(" Found files :" + $fileNames.Count)

  #After getting the files, each file will be iterated to make necessary changes to the values of app setting and connection strings.
  foreach($file in $fileNames)
  {
    Write-Output("Running update script on file: " + $file.FullName)
		
    #Add your app settings key-value below.
    #'timetowakeup' will be your key.
    #'6:00 AM' will your value.
    UpdateConfigAppSettingItem $file.FullName 'timetowakeup' '6:00 AM'
    UpdateConfigAppSettingItem $file.FullName 'timetogotosleep' '10:00 PM'
    
    #Add your connectionsettings key-value below.
    UpdateConfigConnStringItem $file.FullName 'AzureWebJobsDashboard' 'DefaultEndpointsProtocol=https;AccountName=accountnamehere;AccountKey=AccountKeyHere'
    }
}

#Function to replace config files app settings key-values.
function UpdateConfigAppSettingItem([string]$file,[string]$key,[string]$value)
{
    $doc = (Get-Content $file) -as [Xml]
  	$obj = $doc.configuration.appSettings.add | where {$_.Key -eq $key}
	if ($obj -ne $null -and $obj.Key -ne $null -and $obj.value -ne $null) {
	    Write-Output("  Setting " + $key + " from " + $obj.value + " to " + $value + ".")
	    $obj.value = $value
	    $doc.Save($file)
	}
}

#Function to replace config files connection string key-values.
function UpdateConfigConnStringItem([string]$file,[string]$name,[string]$connectionString)
{
    $doc = (Get-Content $file) -as [Xml]
  	$obj = $doc.configuration.connectionStrings.add | where {$_.name -eq $name}
	if ($obj -ne $null -and $obj.name -ne $null -and $obj.connectionString -ne $null) {
	    Write-Output("  Setting " + $name + " from " + $obj.connectionString + " to " + $connectionString + ".")
	    $obj.connectionString = $connectionString
	    $doc.Save($file)
	}
}

Write-Output("==============Starting configuration update script in Repository==============")
#Add your visual studio project folder path  below.
UpdateConfigurationSettings "C:\GitHub\VisualStudioProject"
Write-Output("==============Completed configuration update script in Repository==============")
