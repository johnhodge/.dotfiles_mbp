echo "hello from .zshenv"

function exists() {
    # Command -v is similar to which, though possibly beter
    # https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script/677212#677212
    command -v $1 > /dev/null 2>&1
}
