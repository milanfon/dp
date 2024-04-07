*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        http://localhost:4680
${BROWSER}    Chrome
${DELAY}     0

*** Test Cases ***
Login and check elements
    Open browser    ${URL}    browser=${BROWSER}
    Input Text    id:loginPage.userNameInput    gray
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginButton
    Sleep    ${DELAY}
    Page Should Contain Element    id:stu.mySubjects.successAlert
    Page Should Contain Element    id:stu.mySubjects.enrolledTable.Title
    Page Should Not Contain    xpath://td[text()='Database Systems']

    Close Browser

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    browser=${browser}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Set Selenium Speed
    [Arguments]    ${delay}
    Set Selenium Implicit Wait    ${delay}
    Set Selenium Timeout    ${delay}