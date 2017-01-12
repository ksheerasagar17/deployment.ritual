#Automating deployment Rituals with PowerShell script.

###Update configuration app settings and connection strings scattered all around in solution config files. In one go, you are done updating hundreds of values by using this simple PowerShell script. No knowledge of PowerShell is required to use this script.

This script can be used to update configuration app settings and connection strings within a project. If you are looking are for a quick way to update configuration settings instead of manually copy-pasting then you are in right place. This is ready to use script and all you have to do is run it with your values. I have been manully updating config settings for so many years, and just found out a better way to do it; what a relief. 

Flipping between Prod, Stage, Dev or Local environments is pretty common activity in developers life. However, this switching usually requires changes to key-values in configurations project wise. There are other advanced techniques to avoid manually replacing text everywhere in the project, however i thought using PowerShell is even quicker if you are on timecrunch.

###Step 1: 
Copy your visual studio project folder path and paste it near line as shown below.

```PowerShell
#Add your visual studio project folder path  below.
UpdateConfigurationSettings "C:\GitHub\VisualStudioProject"
```

###Step 2:
Add your AppSettings key-value pairs as shown below.

```PowerShell
#Add your app settings key-value below.
#'timetowakeup' will be your key.
#'6:00 AM' will your value.
UpdateConfigAppSettingItem $file.FullName 'timetowakeup' '6:00 AM'
```

###Step 3:
Add your ConnectionString key-value pairs as shown below.

```PowerShell
#Add your connectionsettings key-value below.
UpdateConfigConnStringItem $file.FullName 'AzureWebJobsDashboard' 'DefaultEndpointsProtocol=https;AccountName=accountnamehere;AccountKey=AccountKeyHere'
```


###Step 4: 
Run the PowerShell script.

####That's all you have to do instead of yours "Copy-Paste-Replace" boring ritual.
