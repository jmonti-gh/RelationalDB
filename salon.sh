#!/bin/bash

P="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Beauty Hair Salon ~~~~~\n"

MENU(){
        if [[ $1 ]]
        then
                echo -e "\n$1"
        fi

        # display a numbered list of services
        echo "Here are the services we offer to you:"
        AV_SRVCS=$($P "SELECT service_id, name FROM services")
        echo "$AV_SRVCS" | while read SRVC_ID BAR NAME
        do
                echo "$SRVC_ID) $NAME"
        done

        # ask for a service to get
        echo -e "\nWich one would you like to take?"
        read SERVICE_ID_SELECTED

        # if input is not a number
        if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
        then
                # send to menu
                MENU "That is not a valid service number."
        else
                # get srvc existance
                SRVC_EXIST=$($P "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
                # if not exist (empty $SRVC_EXIST)
                if [[ -z $SRVC_EXIST ]]
                then
                        MENU "We do not have that service in our list."
                else
                        # get cust. info (PHONE, N)
                        echo -e "\nWhat's your phone number?"
                        read CUSTOMER_PHONE
                        #echo $CUSTOMER_PHONE
                        CUSTOMER_NAME=$($P "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
                        #echo $CUSTOMER_NAME
                        # if cust. doesn't exist
                        if [[ -z $CUSTOMER_NAME ]]
                        then
                                echo -e "\nWhat's your name?"
                                read CUSTOMER_NAME
                                # insert new cust.
                                INS_CUST_RSLT=$($P "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
                        fi
                        # get cust. id
                        CUSTOMER_ID=$($P "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
                        # get service time
                        echo -e "\nWhat time do you like your service?"
                        read SERVICE_TIME
                        # insert appointment
                        #echo CUST_ID: $CUSTOMER_ID
                        #echo SRVC_ID: $SERVICE_ID_SELECTED
                        #echo TIME: $SERVICE_TIME
                        INS_APPOINT_RSLT=$($P "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
                        if [[ $INS_APPOINT_RSLT == "INSERT 0 1" ]]
                        then
                                # get service name
                                SRVC_NM=$($P "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
                                SRVC_NM_FORM=$(echo $SRVC_NM | sed 's/ //')
                                #echo -e "\nI have put you down for a $(echo $SRVC_NM | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $CUSTOMER_NAME\n"
                                echo -e "\nI have put you down for a $SRVC_NM_FORM at $SERVICE_TIME, $CUSTOMER_NAME."
                        else
                                echo -e "\nERROR: Something went erong tryong to insert an appointment\n"
                        fi
                fi
        fi
}

MENU