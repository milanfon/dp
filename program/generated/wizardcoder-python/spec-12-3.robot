*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_PAGE}    http://localhost:4680/tbuis/login
${STUDENT_USER}    orange
${STUDENT_PASS}    pass
${STUDENT_NAME}    Student
${TEACHER_USER}    scatterbrained
${TEACHER_PASS}    pass
${TEACHER_NAME}    Teacher
${BROWSER}    Chrome

*** Test Cases ***
Teacher Scenario
    Teacher Scenario
    Student Scenario

*** Keywords ***
Teacher Scenario
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    ${TEACHER_USER}
    Input Text    id:loginPage.passwordInput    ${TEACHER_PASS}
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.myExamDates.table.cancelButton-0-0
    Click Element    id:tea.menu.setEvaluation
    Click Element    id:tea.menu.evaluationTable
    Click Element    id:tea.evalTable.filter.subjectSelect
    Select From List    id:tea.evalTable.filter.subjectSelect    -1
    Click Element    id:tea.evalTable.filter.submitButton
    Click Element    id:tea.evalTable.table.cancelButton-0-0
    Wait Until Element Is Visible    id:tea.myExamDates.successAlert
    Go To Page    http://localhost:4680/tbuis/teacher-view/setEvaluation
    Wait Until Element Is Visible    id:tea.setEvaluation.form.noRecords
    Go To Page    http://localhost:4680/tbuis/teacher-view/evaluationTable
    Select From List    id:tea.evalTable.filter.subjectSelect    -1
    Click Element    id:tea.evalTable.filter.submitButton
    Page Should Contain Element    xpath://*[contains(text(), 'No exam dates for this subject')]
    Close Browser

Student Scenario
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    ${STUDENT_USER}
    Input Text    id:loginPage.passwordInput    ${STUDENT_PASS}
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.myExamDates
    Page Should Not Contain Element    xpath://*[text()='Computation Structures']
    Close Browser

Go To Page
    [Arguments]    ${url}
    Sleep    ${DELAY}    # Add a delay before going to a new page
    Go To    ${url}