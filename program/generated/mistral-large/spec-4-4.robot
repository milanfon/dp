*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Student View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=loginPage.userNameInput    gray
    Input Password    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginButton
    Wait Until Page Contains    Student's View
    Click Element    id=stu.menu.mySubjects
    Wait Until Page Contains    My Subjects
    ${present1}    Run Keyword And Return Status    Page Should Contain Element    id=stu.mySubjects.successAlert
    ${present2}    Run Keyword And Return Status    Page Should Contain Element    id=stu.mySubjects.enrolledTable.Title
    ${not_present}    Run Keyword And Return Status    Page Should Not Contain Element    xpath//td[text()='Database Systems']
    Close Browser

Teacher View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=loginPage.userNameInput    pedant
    Input Password    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginButton
    Wait Until Page Contains    Teacher's View
    Click Element    id=tea.menu.mySubjects
    Wait Until Page Contains    My Subjects
    ${text1}    Get Text    id=tea.mySubjects.table.listOfStudentsButton-1
    Should Be Equal    ${text1}    Students (0)
    Click Element    id=tea.menu.myExamDates
    Wait Until Page Contains    My Exam Dates
    ${text2}    Get Text    id=tea.myExamDates.table.participantsButton-1-0
    Should Be Equal    ${text2}    Participants (0/10)
    Click Element    id=tea.menu.setEvaluation
    Wait Until Page Contains    Set Evaluation
    Select From List By Index    id=tea.setEvaluation.form.examTermDateSelect    1
    ${visible1}    Run Keyword And Return Status    Page Should Contain Element    id=tea.setEvaluation.form.noOneStudent
    Click Element    id=tea.menu.evaluationTable
    Wait Until Page Contains    Evaluation Table
    Select From List By Index    id=tea.evalTable.filter.subjectSelect    2
    Click Button    id=tea.evalTable.filter.submitButton
    ${visible2}    Run Keyword And Return Status    Page Should Contain Element    xpath//td[text()='No students on this exam date']
    Close Browser