
$ublock = "https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm"
$tampermonkey = "https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo"
$aakiller = "https://reek.github.io/anti-adblock-killer"
$driver = "http://support.amd.com/en-us/download"

start chrome ("{0} {1} {2} {3}" -f $ublock,$tampermonkey,$aakiller,$driver)

pause