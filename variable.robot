*** Settings ***
Library           SeleniumLibrary

*** Variables ***
# ----- URL -----
${url_register}                         https://dev.app.agnoshealth.com/ai_dashboard/agnos/sign_up/
${url_login}                            https://dev.app.agnoshealth.com/ai_dashboard/login
${browser}                              gc
# ----- Locators -----
${locator_email_field}                  id = Email
${locator_password_field}               xpath = (//input[@id='password'])[1]
${locator_confirmpassword_field}        xpath = (//input[@id='password'])[2]
${locator_confirm_button}               xpath = //*[@id="root"]/div/div/div/div[2]/div[3]/button
# ----- Valid Test Data -----
${valid_email}                          test@gmail.com
${valid_password}                       Test@2024
${valid_confirmpassword}                Test@2024
# ----- Invalid Test Data -----
${invalid_email}                        invalidemail
${short_password}                       Ab@1
${password_without_digit}               Ab@abc
${password_without_uppercase}           ab@ab2
${password_without_specialcharacter}    abab2
${mismatch_password}                    Test@5678
# ----- Validation Messages -----
${email_validation_msg}                 The email should be in the format 'test@example.com'
${password_validation_msg}              The password must be at least 8
${confirmpassword_validation_msg}       Confirm password does not match the password.