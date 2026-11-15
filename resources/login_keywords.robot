*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://robotsparebinindustries.com
${BROWSER}    chrome
${USERNAME_INPUT}    id:username
${PASSWORD_INPUT}     id:password
${LOGIN_BUTTON}    css:button[type='submit']
${HOME_PAGE_USERNAME}   css:.username
${LOGOUT_BUTTON}    css:#logout
${ERROR_MESSAGE}    css:.alert-warning

*** Keywords ***
Open Application Browser
    Open browser    ${URL}    ${BROWSER}
    Maximize browser window

Enter Login Credentials
    [Arguments]    ${username}    ${password}
    Input text    ${USERNAME_INPUT}    ${username}
    Input text    ${PASSWORD_INPUT}    ${password}
    Click button    ${LOGIN_BUTTON}

Verify Successful Login
    [Arguments]    ${expected_username}
    Wait until element is visible    ${HOME_PAGE_USERNAME}
    Element text should be    ${HOME_PAGE_USERNAME}    ${expected_username}

Logout From Application
    Wait until element is visible    ${LOGOUT_BUTTON}
    Click button    ${LOGOUT_BUTTON}
    Wait until element is visible    ${LOGIN_BUTTON}
    Wait until element is not visible    ${HOME_PAGE_USERNAME}

Verify Login Error Message
    [Arguments]    ${expected_error_msg}
    Wait until element is visible    ${ERROR_MESSAGE}
    Element should contain    ${ERROR_MESSAGE}    ${expected_error_msg}

Close Application Browser
    Close browser

