#! /bin/sh
basic_gpg_decrypt(){
    [ ! -z "$1" ] && echo "$1" | gpg --passphrase-fd 0 -d $HOME/.masterscreen.gpg
}
generate_gpg_pwfile(){
    PASS=$(whiptail --passwordbox "please enter your secret password" 8 78 --title "password dialog" 3>&1 1>&2 2>&3)
    PASSC=$(whiptail --passwordbox "please confirm your secret password" 8 78 --title "password dialog" 3>&1 1>&2 2>&3)
    [ "$PASS" = "$PASSC" ] && echo $PASS | gpg --cipher-algo AES256 --password "$PASS" --output "$HOME/.masterscreen.gpg" --symmetric -
}
generate_gpg_datakeys(){
    gpg --gen-key
}
load_gpg_datask(){

}
unload_gpg_datask(){
    
}