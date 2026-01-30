Connect-Microsoftteams
#Connect with your admin account 

#Define the path for the initial CSV file to save a list of all users with the corresponding phone numbers
$Exportpath = Read-Host "Enter the path in which you would like to save the csv file. Make sure to remove any quotations from the path"

#Get a list of all users that have phone numbers then output the data in a CSV file
Get-CsOnlineUser | Where-Object {$_.lineuri -ne $null} | Select-Object userprincipalname, lineuri | Export-Csv -path "$exportpath\output1.csv" -notypeinformation
