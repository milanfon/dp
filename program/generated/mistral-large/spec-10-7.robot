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
    Maximize Browser Window
    Login As Teacher
    Check Elements On Teacher Pages
    Close Browser

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
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
    Wait Until Page Contains    My Subjects
    ${remove_buttons}    Get WebElements    xpath=//button[text()='Remove']
    FOR    ${button}    IN    @{remove_buttons}
        ${disabled}    Run Keyword And Return Status    Element Should Be Disabled    ${button}
        Should Be True    ${disabled}
    END
    Click Element    xpath=//button[text()='Remove']
    Wait Until Page Contains    id=tea.mySubjects.successAlert
    Element Should Be Visible    id=tea.mySubjects.successAlert

    Click Element    id=tea.menu.myExamDates
    Wait Until Page Contains    My Exam Dates
    Element Should Not Be Visible    xpath=//th[text()='${SUBJECT}']

    Click Element    id=tea.menu.newExamDates
    Wait Until Page Contains    New Exam Dates
    Element Should Not Be Visible    xpath=//option[text()='${SUBJECT}']

    Click Element    id=tea.menu.setEvaluation
    Wait Until Page Contains    Set Evaluation
    Element Should Not Be Visible    xpath=//option[contains(text(), '${SUBJECT}')]

    Click Element    id=tea.menu.evaluationTable
    Wait Until Page Contains    Evaluation Table
    Element Should Not Be Visible    xpath=//option[text()='${SUBJECT}']

    Click Element    id=tea.menu.otherSubjects
    Wait Until Page Contains    Others' Subjects
    Element Should Be Visible    xpath=//td[text()='${SUBJECT}']

    Click Element    id=tea.menu.listOfAllTeachers
    Wait Until Page Contains    List of All Teachers
    ${rows}    Get WebElements    xpath=//tr[@id='tea.listOfAllTeachers.table.teacherRow-5']
    FOR    ${row}    IN    @{rows}
        ${teacher_cell}    Get WebElement    xpath=.//td[contains(text(), '${SUBJECT}')]
        Should Not Be True    Element Should Be Visible    ${teacher_cell}
    END

Check Elements On Student Pages
    Click Element    id=stu.menu.otherSubjects
    Wait Until Page Contains    Other Subjects
    ${rows}    Get WebElements    xpath=//tr[contains(., '${SUBJECT}')]
    FOR    ${row}    IN    @{rows}
        ${teacher_cell}    Get WebElement    xpath=.//td[contains(text(), '${TEACHER}')]
        Should Not Be True    Element Should Be Visible    ${teacher_cell}
    END