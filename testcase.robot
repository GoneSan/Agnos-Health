*** Settings ***
Library           SeleniumLibrary
Resource          ${CURDIR}/variable.robot
Resource          ${CURDIR}/keyword.robot
Test Setup        Open Registration Page
Test Teardown     Close Browser And Clean Up

*** Test Cases ***
TC01 Register With Valid Data
    [Documentation]    ทดสอบการสมัครสมาชิกด้วยข้อมูลที่ถูกต้อง
    [Tags]    Positive Case
    Fill Registration Form      ${valid_email}    ${valid_password}    ${valid_confirmpassword}
    Click Confirm Button
    Wait Until Page Contains    Log-in    timeout=10s
    Location Should Be          ${url_login}

TC02 Register With Invalid Email Format
    [Documentation]    ทดสอบการกรอก Email ผิดรูปแบบ
    [Tags]    Negative Case
    Fill Registration Form    ${invalid_email}    ${valid_password}    ${valid_confirmpassword}
    Click Confirm Button
    Verify Validation Message Should Be Visible    ${email_validation_msg}

TC03 Register With Short Password
    [Documentation]    ทดสอบการกรอก Password ที่สั้นเกินไป (ไม่ถึง 8 ตัวอักษร)
    [Tags]    Negative Case
    Fill Registration Form    ${valid_email}    ${short_password}    ${short_password}
    Click Confirm Button
    Verify Validation Message Should Be Visible    ${password_validation_msg}

TC04 Register with Password without a digit
    [Documentation]    ทดสอบการกรอก Password ไม่มีตัวเลข
    [Tags]    Negative Case
    Fill Registration Form    ${valid_email}    ${password_without_digit}    ${password_without_digit}
    Click Confirm Button
    Verify Validation Message Should Be Visible    ${password_validation_msg}

TC05 Register with Password without a Uppercase letter
    [Documentation]    ทดสอบการกรอก Password ไม่มีตัวพิมพ์ใหญ่
    [Tags]    Negative Case
    Fill Registration Form    ${valid_email}    ${password_without_uppercase}    ${password_without_uppercase}
    Click Confirm Button
    Verify Validation Message Should Be Visible    ${password_validation_msg}

TC06 Register with Password without a special character
    [Documentation]    ทดสอบการกรอก Password ไม่มีตัวอักษรพิเศษ
    [Tags]    Negative Case
    Fill Registration Form    ${valid_email}    ${password_without_specialcharacter}    ${password_without_specialcharacter}
    Click Confirm Button
    Verify Validation Message Should Be Visible    ${password_validation_msg}

TC07 Register with Correct Password that does not match the Confirm Password
    [Documentation]    ทดสอบการกรอก Password ที่ถูกต้องแต่ไม่ตรงกับ Confirm Password (Confirm Password ผิด และข้อนี้มี Bug)
    [Tags]    Negative Case
    Fill Registration Form    ${valid_email}    ${valid_password}    ${mismatch_password}
    Click Confirm Button
    Verify Validation Message Should Be Visible    ${confirm_password_validation_msg}
    Sleep    10s
    Location Should Be    ${url_register}

TC08 Register with Password that does not match the Confirm Password
    [Documentation]    ทดสอบการกรอก Password ไม่ตรงกับ Confirm Password
    [Tags]    Negative Case
    Fill Registration Form    ${valid_email}    ${mismatch_password}    ${valid_password}
    Click Confirm Button
    Verify Validation Message Should Be Visible    ${confirm_password_validation_msg}
    Location Should Be    ${url_register}

TC09 Clicking the Confirm button without entering any data
    [Documentation]    ทดสอบการกดปุ่ม Confirm โดยไม่กรอกข้อมูล ปุ่มจะต้องถูก Disable ไว้
    [Tags]    Negative Case
    Element Should Be Disabled    ${locator_confirm_button}