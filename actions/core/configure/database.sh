#!/usr/bin/env bash

core_configure_database ()
{
    ascii

    local envFile="${CORE_DATA}/.env"

    . "$envFile"

    read -p "Enter the database host, or press ENTER for the default [$QREDIT_DB_HOST]: " inputHost
    read -p "Enter the database port, or press ENTER for the default [$QREDIT_DB_PORT]: " inputPort
    read -p "Enter the database username, or press ENTER for the default [$QREDIT_DB_USERNAME]: " inputUsername
    read -p "Enter the database password, or press ENTER for the default [$QREDIT_DB_PASSWORD]: " inputPassword
    read -p "Enter the database name, or press ENTER for the default [qredit_${CORE_NETWORK}]: " inputDatabase

    if [[ ! -z "$inputHost" ]]; then
        sed -i -e "s/QREDIT_DB_HOST=$QREDIT_DB_HOST/QREDIT_DB_HOST=$inputHost/g" "$envFile"
    fi

    if [[ ! -z "$inputPort" ]]; then
        sed -i -e "s/QREDIT_DB_PORT=$QREDIT_DB_PORT/QREDIT_DB_PORT=$inputPort/g" "$envFile"
    fi

    if [[ ! -z "$inputUsername" ]]; then
        sed -i -e "s/QREDIT_DB_USERNAME=$QREDIT_DB_USERNAME/QREDIT_DB_USERNAME=$inputUsername/g" "$envFile"
    fi

    if [[ ! -z "$inputPassword" ]]; then
        sed -i -e "s/QREDIT_DB_PASSWORD=$QREDIT_DB_PASSWORD/QREDIT_DB_PASSWORD=$inputPassword/g" "$envFile"
    fi

    if [[ ! -z "$inputDatabase" ]]; then
        sed -i -e "s/QREDIT_DB_DATABASE=$QREDIT_DB_DATABASE/QREDIT_DB_DATABASE=$inputDatabase/g" "$envFile"
    else
        sed -i -e "s/QREDIT_DB_DATABASE=$QREDIT_DB_DATABASE/QREDIT_DB_DATABASE=qredit_${CORE_NETWORK}/g" "$envFile"
    fi

    . "$envFile"
}
