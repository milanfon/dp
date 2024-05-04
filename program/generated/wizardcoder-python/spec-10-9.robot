*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    Chrome
${DELAY}   0
${USERNAME}    strict
${PASSWORD}    pass
${USERNAME_ST}    orange
${PASSWORD_ST}    pass

*** Test Cases ***

Scenario 10
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    10000    10000
    Input Text    id=loginPage.userNameInput    ${USERNAME}
    Input Text    id=loginPage.passwordInput    ${PASSWORD}
    Click Button    id=loginPage.loginFormSubmit
    Click Link    id=tea.menu.mySubjects
    Click Button    id=tea.mySubjects.table.unregisterSubjectButton-0
    Click Link    id=tea.menu.myExamDates
    Click Link    id=tea.menu.newExamDates
    Click Link    id=tea.menu.setEvaluation
    Click Link    id=tea.menu.evaluationTable
    Click Link    id=tea.menu.otherSubjects
    Click Link    id=tea.menu.listOfAllTeachers
    Logout
    Logout
    Close Browser

Scenario 10 Student
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    10000    10000
    Input Text    id=loginPage.userNameInput    ${USERNAME_ST}
    Input Text    id=loginPage.passwordInput    ${PASSWORD_ST}
    Click Button    id=loginPage.loginFormSubmit
    Click Link    id=stu.menu.otherSubjects
    Logout
    Close Browser

*** Keywords ***
Logout
    Click Link    id=header.logout
    Click Button    id=logoutFormSubmit

*** Test Teardown ***
Close Browser

*** Keywords ***
Logout
    Click Link    id=header.logout
    Click Button    id=logoutFormSubmit

*** Test Teardown ***
Close Browser