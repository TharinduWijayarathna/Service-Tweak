#!/bin/bash

# Function to start services
start_services() {
    echo "Starting MySQL service..."
    sudo systemctl start mysql
    if [ $? -eq 0 ]; then
        echo "MySQL started successfully."
    else
        echo "Failed to start MySQL."
    fi

    echo "Starting Apache2 service..."
    sudo systemctl start apache2
    if [ $? -eq 0 ]; then
        echo "Apache2 started successfully."
    else
        echo "Failed to start Apache2."
    fi

    echo "Starting Node.js processes..."
    # Example command for Node.js services. Customize if necessary.
    # Assume a Node.js application located in `/path/to/app`
    # (Uncomment below if you want to start a specific app)
    # cd /path/to/app && nohup node app.js &
    echo "Ensure to start specific Node.js apps manually if required."
}

# Function to stop services
stop_services() {
    echo "Stopping MySQL service..."
    sudo systemctl stop mysql
    if [ $? -eq 0 ]; then
        echo "MySQL stopped successfully."
    else
        echo "Failed to stop MySQL or it might not be running."
    fi

    echo "Stopping Apache2 service..."
    sudo systemctl stop apache2
    if [ $? -eq 0 ]; then
        echo "Apache2 stopped successfully."
    else
        echo "Failed to stop Apache2 or it might not be running."
    fi

    echo "Stopping Node.js processes..."
    pkill node
    if [ $? -eq 0 ]; then
        echo "Node.js processes stopped successfully."
    else
        echo "No Node.js processes found or failed to stop."
    fi
}

# Main script logic
echo "Do you want to start or stop the services? (start/stop)"
read action

if [ "$action" == "start" ]; then
    start_services
elif [ "$action" == "stop" ]; then
    stop_services
else
    echo "Invalid input. Please type 'start' or 'stop'."
fi
