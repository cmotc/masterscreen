#! /bin/sh
basic_gpg_decrypt(){
    [ ! -z "$1" ] && VAL=$(gpg --passphrase "$1" -d $HOME/.masterscreen.gpg)
    echo "$VAL"
}
generate_gpg_pwfile(){
    PASS=$(whiptail --passwordbox "please enter your secret password" 8 78 --title "password dialog" 3>&1 1>&2 2>&3)
    PASSC=$(whiptail --passwordbox "please confirm your secret password" 8 78 --title "password dialog" 3>&1 1>&2 2>&3)
    PASSS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 128 | head -n 1)
    [ "$PASS" = "$PASSC" ] && echo "$PASSS" | gpg --cipher-algo AES256 --passphrase "$PASS" --output "$HOME/.masterscreen.gpg" --symmetric -
    unset PASS; unset PASSC; unset PASSS;   
}
generate_gpg_datakeys(){
    gpg --gen-key
    [ cat "$HOME/.gnupg/gpg-agent.conf" | grep allow-loopback-pinentry ] || echo allow-loopback-pinentry > "$HOME/.gnupg/gpg-agent.conf"
    [ cat "$HOME/.gnupg/gpg-agent.conf" | grep "pinentry-mode loopback" ] || echo "pinentry-mode loopback" > "$HOME/.gnupg/gpg-agent.conf"
}
load_gpg_datask(){
    gpg-agent --add "$2" --passphrase "$1"
}
unload_gpg_datask(){
    gpg-connect-agent reloadagent /bye
}