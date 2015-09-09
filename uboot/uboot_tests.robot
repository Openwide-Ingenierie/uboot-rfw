*** Settings ***
Documentation     Test case for testing U-BOOT through a serial connection
...
...               U-Boot tests can only be done over a serial connection. As
...               there are no Serial Library for Robot Framework, we use the
...               Robot Framework Telnet Library and ser2net. ser2net creates a
...               passthrough between a serial connection and a tcp connection.
...               This does not start ser2net. You must have it running before
...               starting the test suite.
...
Variables         uboot_settings.py
Library           Telnet    prompt=${prompt}    timeout=5     newline=\n
Suite Setup       Open Uboot Console
Test Template     Command Output Should Be
Suite Teardown    Close Connection



*** Variables ***

*** Test Cases ***    EXPECTED             COMMAND 
IP Address            ${ip_address}        printenv ipaddr
BDINFO                ${mac_address}       bdinfo
Version               ${uboot_version}     version

*** Keywords ***
Command Output Should Be
    [Documentation]     Execute Command over telnet and check its output
    [Arguments]         ${expected}     ${command}
    ${out}=    Execute Command    ${command}
    Should Contain    ${out}    ${expected}

Open Uboot Console
    [Documentation]     Keyword used to 'hit any key' during U-Boot startup
    Open Connection     ${address}    port=${port}
    Set Timeout    30
    Read Until    login_prompt=U-Boot
    Write Bare    \n
    Read Until Prompt
