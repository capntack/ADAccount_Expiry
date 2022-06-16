# AD Account Expiration Script
#
# Please see the README.
# -Tack

$expired = Search-ADAccount -AccountExpired | Select Name, SamAccountName, Manager, Enabled, AccountExpirationDate
$expiring = Search-ADAccount -AccountExpiring -TimeSpan "14" | Select Name, SamAccountName, Manager, Enabled, AccountExpirationDate
$disabled = Search-ADAccount -AccountDisabled | Select Name, SamAccountName, Manager, Enabled, AccountExpirationDate

&{$expired; $expiring; $disabled} | Export-Csv .\ad_account_expiration_report.csv -NoTypeInformation
