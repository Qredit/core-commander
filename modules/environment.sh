#!/usr/bin/env bash

setup_environment_file ()
{
    local envFile="${CORE_DATA}/.env"

    if [[ ! -e "${envFile}" ]]; then
        mkdir -p "${HOME}/.qredit"
        touch "${envFile}"
    fi

    if ! grep -q "QREDIT_LOG_LEVEL" "${envFile}"; then
        echo "QREDIT_LOG_LEVEL=debug" >> "$envFile" 2>&1
    fi

    if ! grep -q "QREDIT_DB_HOST" "${envFile}"; then
        echo "QREDIT_DB_HOST=localhost" >> "$envFile" 2>&1
    fi

    if ! grep -q "QREDIT_DB_PORT" "${envFile}"; then
        echo "QREDIT_DB_PORT=5432" >> "$envFile" 2>&1
    fi

    if ! grep -q "QREDIT_DB_USERNAME" "${envFile}"; then
        echo "QREDIT_DB_USERNAME=${USER}" >> "$envFile" 2>&1
    fi

    if ! grep -q "QREDIT_DB_PASSWORD" "${envFile}"; then
        echo "QREDIT_DB_PASSWORD=password" >> "$envFile" 2>&1
    fi

    if ! grep -q "QREDIT_DB_DATABASE" "${envFile}"; then
        echo "QREDIT_DB_DATABASE=qredit_${CORE_NETWORK}" >> "$envFile" 2>&1
    fi

    . "${envFile}"
}

setup_environment ()
{
    set_locale

    if [[ ! -f "$commander_config" ]]; then
        ascii

        install_base_dependencies
        install_program_dependencies
        install_nodejs_dependencies
        install_system_updates

        # create ~/.commander
        touch "$commander_config"

        echo "CORE_REPO=https://github.com/Qredit/core" >> "$commander_config" 2>&1
        echo "CORE_BRANCH=master" >> "$commander_config" 2>&1
        echo "CORE_DIR=${HOME}/qredit-core" >> "$commander_config" 2>&1
        echo "CORE_DATA=${HOME}/.qredit" >> "$commander_config" 2>&1
        echo "CORE_CONFIG=${HOME}/.qredit/config" >> "$commander_config" 2>&1
        echo "CORE_TOKEN=qredit" >> "$commander_config" 2>&1
        echo "CORE_NETWORK=mainnet" >> "$commander_config" 2>&1
        echo "EXPLORER_REPO=https://github.com/Qredit/explorer" >> "$commander_config" 2>&1
        echo "EXPLORER_DIR=${HOME}/qredit-explorer" >> "$commander_config" 2>&1

        . "$commander_config"

        # create ~/.qredit/.env
        setup_environment_file
        success "All system dependencies have been installed!"

        check_and_recommend_reboot
        press_to_continue
    fi

    if [[ -e "$commander_config" ]]; then
        if ! grep -q "CORE_REPO" "${commander_config}"; then
            echo "CORE_REPO=https://github.com/Qredit/core" >> "$commander_config" 2>&1
        fi

        if ! grep -q "CORE_BRANCH" "${commander_config}"; then
            echo "CORE_BRANCH=master" >> "$commander_config" 2>&1
        fi

        if ! grep -q "CORE_DIR" "${commander_config}"; then
            echo "CORE_DIR=${HOME}/qredit-core" >> "$commander_config" 2>&1
        fi

        if ! grep -q "CORE_DATA" "${commander_config}"; then
            echo "CORE_DATA=${HOME}/.qredit" >> "$commander_config" 2>&1
        fi

        if ! grep -q "CORE_CONFIG" "${commander_config}"; then
            echo "CORE_CONFIG=${HOME}/.qredit/config" >> "$commander_config" 2>&1
        fi

        if ! grep -q "CORE_TOKEN" "${commander_config}"; then
            echo "CORE_TOKEN=qredit" >> "$commander_config" 2>&1
        fi

        if ! grep -q "CORE_NETWORK" "${commander_config}"; then
            echo "CORE_NETWORK=mainnet" >> "$commander_config" 2>&1
        fi

        if ! grep -q "EXPLORER_REPO" "${commander_config}"; then
            echo "EXPLORER_REPO=https://github.com/Qredit/explorer" >> "$commander_config" 2>&1
        fi

        if ! grep -q "EXPLORER_DIR" "${commander_config}"; then
            echo "EXPLORER_DIR=${HOME}/qredit-explorer" >> "$commander_config" 2>&1
        fi

        . "$commander_config"

        setup_environment_file
    fi
}
