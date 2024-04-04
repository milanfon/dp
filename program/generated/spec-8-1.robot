*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${BASE_URL}       http://localhost:4680/tbuis
${USERNAME}       green
${PASSWORD}       pass

*** Test Cases ***
Register For Other Exam Dates And Verify
    Open University Information System
    Login As Student    ${USERNAME}    ${PASSWORD}
    Register For Exam Date
    Verify Registration Success Alert
    Navigate To My Exam Dates
    Verify Programming in Java Exam Date
    Close Browser

*** Keywords ***
Open University Information System
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    2s

Login As Student
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Register For Exam Date
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s

Verify Registration Success Alert
    Wait Until Element Is Visible    id=stu.otherExamDates.successAlert    10s

Navigate To My Exam Dates
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s

Verify Programming in Java Exam Date
    Page Should Contain Element    xpath=//td[contains(text(), "Programming in Java")]

Close Browser
    Close All Browsers
