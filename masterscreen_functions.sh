#! /bin/sh
basic_gpg_decrypt(){
    [ ! -z "$1" ] && echo "$1" | gpg --passphrase-fd 0 $HOME/.masterscreen.gpg
}
generate_gpg_pwfile(){

}
generate_gpg_datakeys(){

}
unload_gpg_datask(){

}