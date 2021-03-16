enable-wsmancredssp -role "server" -force
new-pssessionconfigurationfile -modulestoimport onetech, activedirectory, microsoft.powershell.utility `
- visiblecmdlets ('*onetech*', '*ad*', '*format*' , 'get-help') `
-visiblefuntions ('tabexpansion2') -visiblealiases ('exit', 'ft' , 'fl') -languagemode contrainedlanguage `
-visibleproviders filesystem`
-sessiontype 'restrictedtemoteserver' -path 'c:\dcmonly.pssc'
register-pssessionconfiguration -name "DCMs" -path c:\dcmonly.pssc -startupscript c:\psdata\dcmprod.ps1