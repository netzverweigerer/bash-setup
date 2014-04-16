
# pack function
function pack () {
    args="$@"
    if [[ ! -d "$args" ]]; then
        echo "$args is not a directory (or multiple directories/files have been supplied)"
    else
        echo "packing: $args"
        filename="$(echo "$args" | sed 's/\[/_/g;s/\]/_/g;s/(/_/g;s/)/_/g')"
        filename="${filename%/}"
        filename="${filename}.tar.gz"
        tar czf "$filename" "$args" && \
        echo "Packed file has been written to: $filename"
    fi
}

if [ $(which unzip >/dev/null 2>&1) ]; then
    unzip_cmd="$(which unzip)"
    function uz () {
        args="$@"
        if [[ ! -f "$args" ]]; then
        echo "$args is not a valid filename"
        else
        echo "File information: $(file "$args")"
        echo "${args%.zip}"
        $unzip_cmd -d "${args%.zip}" "$args"
        echo "Deleting origin ZIP-File: $args"
        rm -fv "$args"
        fi
    }
fi



# keychain stuff
alias ssh_cmd="$(which ssh)"
function ssh () {
    echo "$@" >> $HOME/.keychain-args
    echo "$(date)" > $HOME/.keychain-output
    # using keychain for gpg made problems, so we only use the id_rsa SSH key here:
    # keychain id_rsa 44248BA0
    keychain id_rsa >> $HOME/.keychain-output 2>&1
    [ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
    [ -f $HOME/.keychain/$HOSTNAME-sh ] && \
        . $HOME/.keychain/$HOSTNAME-sh
    [ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && \
        . $HOME/.keychain/$HOSTNAME-sh-gpg
        ssh_cmd "$@"
}

function pong () {
    while :; do width=$((COLUMNS-5)); genspace() { s=""; for i in $(seq 0 $1); do s="$s "; done; echo -n "$s"; }; paint() { pad="$(genspace $x)"; fill="$(genspace $((width-x)))"; printf "|${pad}*${fill}|\r"; }; for x in $(seq 0 $width); do paint; sleep .01; done; for x in $(seq $width -1 0); do paint; sleep .01; done; done
}
