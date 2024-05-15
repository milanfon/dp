*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp
${USERNAME}    strict
${PASSWORD}    pass
${SUBJECT}    Operating Systems
${TEACHER}    Peter Strict

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    0.5

    Login As Teacher
    Check Elements On Teacher Pages

    Close Browser

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    0.5

    Login As Student
    Check Elements On Student Pages

    Close Browser

*** Keywords ***
Login As Teacher
    Input Text    id=loginPage.userNameInput    ${USERNAME}
    Input Text    id=loginPage.passwordInput    ${PASSWORD}
    Click Button    id=loginPage.loginFormSubmit

Login As Student
    Input Text    id=loginPage.userNameInput    orange
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit

Check Elements On Teacher Pages
    Click Element    id=tea.menu.mySubjects

    ${buttons}    Get WebElements    xpath=//button[contains(text(), 'Remove') and @disabled]
    Should Be Equal    ${buttons[0].get_attribute('disabled')}    true

    Click Element    xpath=//button[contains(text(), 'Remove') and not(@disabled)]
    Wait Until Page Contains Element    id=tea.mySubjects.successAlert

    Click Element    id=tea.menu.myExamDates
    Should Not Contain Element    xpath=//th[contains(text(), '${SUBJECT}')]

    Click Element    id=tea.menu.newExamDates
    Should Not Contain Element    xpath=//option[contains(text(), '${SUBJECT}')]

    Click Element    id=tea.menu.setEvaluation
    Should Not Contain Element    xpath=//option[contains(text(), '${SUBJECT}')]

    Click Element    id=tea.menu.evaluationTable
    Should Not Contain Element    xpath=//option[contains(text(), '${SUBJECT}')]

    Click Element    id=tea.menu.otherSubjects
    Should Contain Element    xpath=//td[contains(text(), '${SUBJECT}')]

    Click Element    id=tea.menu.listOfAllTeachers
    ${rows}    Get WebElements    xpath=//tr[@id='tea.listOfAllTeachers.table.teacherRow-5']/td
    Should Not Contain Element    ${rows}    xpath://td[contains(text(), '${SUBJECT}')]

Check Elements On Student Pages
    Click Element    id=stu.menu.otherSubjects
    ${rows}    Get WebElements    xpath=//tr[contains(., '${SUBJECT}')]
    Should Not Contain Element    ${rows}    xpath://td[contains(text(), '${TEACHER}')]
