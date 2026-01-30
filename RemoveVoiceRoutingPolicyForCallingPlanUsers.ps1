Connect-MicrosoftTeams

#First, Check for users that have a voice routing policy
$userswithroutingpolicy = get-csonlineuser | Where-Object {$_.onlinevoiceroutingpolicy -ne $null} | Select-Object userprincipalname, lineuri, onlinevoiceroutingpolicy

#loop through the users that have a voice routing policy
foreach ($userwithroutingpolicy in $userswithroutingpolicy) {
$userwithroutingpolicy.lineuri = $usernumber 
$usernumber -replace '^tel:', ''
$iscallingplan = Get-CsPhoneNumberassignment -telephonenumber $usernumber
#Check if the same user that has a voicerouting policy, has their phone number assigned as callingplan
if ($iscallingplan.numbertype -eq "Callingplan") {
#remove the users voice routing policy
grant-CsOnlineVoiceRoutingPolicy -identity $userwithroutingpolicy.userprincipalname -PolicyName $null
Write-Host "Voice routing policy removed for user $userwithroutingpolicy.userprincipalname"
}
else {
Write-Host "User $userwithroutingpolicy.userprincipalname has a voicerouting policy but their number is not assigned as callingplan"
}
}
