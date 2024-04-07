*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${LOGIN_URL}    http://localhost:4680/tbuis/
${BROWSER}    Chrome
${DELAY}    ${0}    # Delay between steps

*** Test Cases ***

Test spec 8
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Login as Student
    Verify Student
    Login as Teacher
    Verify Teacher
    Close Browser

*** Keywords ***

Login as Student
    Input Text    id:loginPage.userNameInput    green
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    id:stu.menu.otherExamDates
    Click Button    id:stu.otherExamDates.table.registerButton-2-0
    Click Link    id:stu.menu.myExamDates

Login as Teacher
    Input Text    id:loginPage.userNameInput    strict
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    id:tea.menu.myExamDates
    Click Button    id:tea.myExamDates.table.participantsButton-1-0

Verify Student
    ${exists}    Run Keyword And Return Status    Wait Until Element Is Visible    id:stu.otherExamDates.successAlert    ${10}
    Run Keyword If    '${exists}'=='${False}'    Fail    Element with id "stu.otherExamDates.successAlert" not found
    ${exists}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//td[.="Programming in Java"]    ${10}
    Run Keyword If    '${exists}'=='${False}'    Fail    Element <td> with text "Programming in Java" not found

Verify Teacher
    ${exists}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//td[.="Mia Orange"]    ${10}
    Run Keyword If    '${exists}'=='${False}'    Fail    Element <td> with text "Mia Orange" not found    ${10}
    ...    Element with text "Mia Orange" not found