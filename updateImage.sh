
STATIC_HACK_THE_BOX_URL=http://www.hackthebox.eu/badge/image/799295
SCRIPT_HACK_THE_BOX_URL=https://www.hackthebox.eu/badge/799295

STATIC_TRY_HACK_ME_URL=https://tryhackme-badges.s3.amazonaws.com/Skyworship.png
SCRIPT_TRY_HACK_ME_URL=https://tryhackme.com/badge/195364


function update_img() {
    cd img
    wget -O TryHackMe.png $STATIC_TRY_HACK_ME_URL
    wget -O HackTheBox.png $STATIC_HACK_THE_BOX_URL
}
