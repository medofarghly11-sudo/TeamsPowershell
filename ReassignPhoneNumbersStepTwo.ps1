Connect-MicrosoftTeams

#First, we read the source csv file 
$Targetusers = read-host "Enter the path for the CSV file that has the list of users with the corresponding phonen numbers"
#Then you will need to define the phonenumber type based on your usage
$phonenumbertype = read-host "Enter the phonenumber type. Please choose between DirectRouting or Callingplan or Operatorconnect"

#loop through each user and assign the phone numbers
foreach ($Targetuser in $Targetusers) {
$phonenumber = $Targetuser.lineuri
$phonenumber -replace '^tel:', ''
Set-CsPhoneNumberAssignment -PhoneNumber $Phonenumber -Identity $Targetuser.userprincipalname -phonenumbertype $phonenumbertype
}
