*** Settings ***
Resource    ../resources/login_keywords.robot
Test Setup    Open Application Browser
Test Teardown    Close Application Browser


*** Test Cases ***
Verify Valid User Login
    [Tags]    smoke    positive    login
    [Documentation]    Verify that a valid user can log into the application
    Enter Login Credentials    maria    thoushallnotpass
    Verify Successful Login    maria

Verify Successful Logout
    [Tags]    regression    positive    logout
    [Documentation]    Verify that user can logout of the application successfully after clicking logout button
    Enter Login Credentials    maria    thoushallnotpass
    Logout From Application

Verify Invalid User Login
    [Tags]      regression    negative    login
    [Documentation]    Verify a invalid user cannot log into the system and app displays appropriate error message
    Enter Login Credentials    admin   Test123
    Verify Login Error Message    Invalid username or password.

