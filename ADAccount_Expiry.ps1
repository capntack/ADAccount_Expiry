# AD Account Expiration Script
#
# Please see the README.
# -Tack

$expired = Search-ADAccount -AccountExpired | Select Name, SamAccountName, DistinguishedName, Enabled, AccountExpirationDate
$expiring = Search-ADAccount -AccountExpiring -TimeSpan "14" | Select Name, SamAccountName, DistinguishedName, Enabled, AccountExpirationDate
$disabled = Search-ADAccount -AccountDisabled | Select Name, SamAccountName, DistinguishedName, Enabled, AccountExpirationDate

&{$expired; $expired; $disabled} | Export-Csv .\ad_account_expiration_report.csv -NoTypeInformation
