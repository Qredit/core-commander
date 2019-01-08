#!/usr/bin/env bash

menu_manage_explorer_help ()
{
    ascii

    text_yellow "    Install Qredit Explorer (I)"
    text_white "    installs Qredit Explorer on your server."
    echo

    text_yellow "    Stop Qredit Explorer (K)"
    text_white "    stops the Qredit Explorer process (shown only if the Qredit Explorer process is running)."
    echo

    text_yellow "    Start Qredit Explorer (S)"
    text_white "    starts the Qredit Explorer process (shown only if Qredit Explorer is installed)."
    echo

    text_yellow "    Restart Qredit Explorer (R)"
    text_white "    restarts (stops and then starts) the Qredit Explorer process (shown only if Qredit Explorer is installed and running)."
    echo

    text_yellow "    Update Qredit Explorer (U)"
    text_white "    updates Qredit Explorer if a new version is available (shown only if Qredit Explorer is installed)."
    echo

    text_yellow "    Uninstall Qredit Explorer (P)"
    text_white "    uninstalls Qredit Explorer from your system (shown only if Qredit Explorer is installed)."
    echo

    text_yellow "    Show Log (L)"
    text_white "    shows the PM2 explorer process log."
    echo

    text_yellow "    Show Help (H)"
    text_white "    opens the help file where all this information is available."

    divider

    text_blue "    For more information head over to https://qredit.io/knowledge-base/"
    echo

    press_to_continue

    menu_main
}
