*** Settings ***
Library           SeleniumLibrary
Resource          ${CURDIR}/variable.robot

*** Keywords ***
Open Registration Page
    Open Browser    ${url_register}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Create Account

Input Email
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${locator_email_field}
    Input Text     ${locator_email_field}    ${email}

Input Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${locator_password_field}
    Input Text     ${locator_password_field}    ${password}

Input Confirm Password
    [Arguments]    ${confirm_password}
    Wait Until Element Is Visible    ${locator_confirmpassword_field}
    Input Text     ${locator_confirmpassword_field}    ${confirm_password}

Click Confirm Button
    Wait Until Element Is Enabled    ${locator_confirm_button}
    Click Button    ${locator_confirm_button}

Fill Registration Form
    [Arguments]    ${email}    ${password}    ${confirm_password}
    Input Email    ${email}
    Input Password    ${password}
    Input Confirm Password    ${confirm_password}

Verify Validation Message Should Be Visible
    [Arguments]    ${message}
    Wait Until Page Contains    ${message}

Close Browser And Clean Up
    Close All Browsers