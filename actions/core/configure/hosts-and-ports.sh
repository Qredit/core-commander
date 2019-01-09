#!/usr/bin/env bash

core_configure_hosts_and_ports ()
{
    local envFile="${CORE_DATA}/.env"

    . "$envFile"

    # @qae/core-p2p
    read -p "Would you like to configure the P2P API? [y/N] : " choice

    if [[ "$choice" =~ ^(yes|y|Y) ]]; then
        read -p "Enter the P2P API host, or press ENTER for the default [${QREDIT_P2P_HOST}]: " inputHost
        read -p "Enter the P2P API port, or press ENTER for the default [${QREDIT_P2P_PORT}]: " inputPort

        if [[ ! -z "$inputHost" ]]; then
            sed -i -e "s/QREDIT_P2P_HOST=$QREDIT_P2P_HOST/QREDIT_P2P_HOST=$inputHost/g" "$envFile"
        fi

        if [[ ! -z "$inputPort" ]]; then
            sed -i -e "s/QREDIT_P2P_PORT=$QREDIT_P2P_PORT/QREDIT_P2P_PORT=$inputPort/g" "$envFile"
        fi
    fi

    # @qae/core-api
    read -p "Would you like to configure the Public API? [y/N] : " choice

    if [[ "$choice" =~ ^(yes|y|Y) ]]; then
        read -p "Enter the Public API host, or press ENTER for the default [${QREDIT_API_HOST}]: " inputHost
        read -p "Enter the Public API port, or press ENTER for the default [${QREDIT_API_PORT}]: " inputPort

        if [[ ! -z "$inputHost" ]]; then
            sed -i -e "s/QREDIT_API_HOST=$QREDIT_API_HOST/QREDIT_API_HOST=$inputHost/g" "$envFile"
        fi

        if [[ ! -z "$inputPort" ]]; then
            sed -i -e "s/QREDIT_API_PORT=$QREDIT_API_PORT/QREDIT_API_PORT=$inputPort/g" "$envFile"
        fi
    fi

    # @qae/core-webhooks
    read -p "Would you like to configure the Webhooks API? [y/N] : " choice

    if [[ "$choice" =~ ^(yes|y|Y) ]]; then
        read -p "Enter the Webhooks API host, or press ENTER for the default [${QREDIT_WEBHOOKS_HOST}]: " inputHost
        read -p "Enter the Webhooks API port, or press ENTER for the default [${QREDIT_WEBHOOKS_PORT}]: " inputPort

        if [[ ! -z "$inputHost" ]]; then
            sed -i -e "s/QREDIT_WEBHOOKS_HOST=$QREDIT_WEBHOOKS_HOST/QREDIT_WEBHOOKS_HOST=$inputHost/g" "$envFile"
        fi

        if [[ ! -z "$inputPort" ]]; then
            sed -i -e "s/QREDIT_WEBHOOKS_PORT=$QREDIT_WEBHOOKS_PORT/QREDIT_WEBHOOKS_PORT=$inputPort/g" "$envFile"
        fi
    fi

    # @qae/core-graphql
    read -p "Would you like to configure the GraphQL API? [y/N] : " choice

    if [[ "$choice" =~ ^(yes|y|Y) ]]; then
        read -p "Enter the GraphQL API host, or press ENTER for the default [${QREDIT_GRAPHQL_HOST}]: " inputHost
        read -p "Enter the GraphQL API port, or press ENTER for the default [${QREDIT_GRAPHQL_PORT}]: " inputPort

        if [[ ! -z "$inputHost" ]]; then
            sed -i -e "s/QREDIT_GRAPHQL_HOST=$QREDIT_GRAPHQL_HOST/QREDIT_GRAPHQL_HOST=$inputHost/g" "$envFile"
        fi

        if [[ ! -z "$inputPort" ]]; then
            sed -i -e "s/QREDIT_GRAPHQL_PORT=$QREDIT_GRAPHQL_PORT/QREDIT_GRAPHQL_PORT=$inputPort/g" "$envFile"
        fi
    fi

    # @qae/core-json-rpc
    read -p "Would you like to configure the JSON-RPC API? [y/N] : " choice

    if [[ "$choice" =~ ^(yes|y|Y) ]]; then
        read -p "Enter the JSON-RPC host, or press ENTER for the default [${QREDIT_JSONRPC_HOST}]: " inputHost
        read -p "Enter the JSON-RPC port, or press ENTER for the default [${QREDIT_JSONRPC_PORT}]: " inputPort

        if [[ ! -z "$inputHost" ]]; then
            sed -i -e "s/QREDIT_JSONRPC_HOST=$QREDIT_JSONRPC_HOST/QREDIT_JSONRPC_HOST=$inputHost/g" "$envFile"
        fi

        if [[ ! -z "$inputPort" ]]; then
            sed -i -e "s/QREDIT_JSONRPC_PORT=$QREDIT_JSONRPC_PORT/QREDIT_JSONRPC_PORT=$inputPort/g" "$envFile"
        fi
    fi

}
