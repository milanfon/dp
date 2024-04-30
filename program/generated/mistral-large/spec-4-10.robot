*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login    gray    pass
    Click Element    xpath://a[contains(@id, 'stu.menu.mySubjects')]
    Wait Until Page Contains    My Subjects
    ${success_alert_present}=    Run Keyword And Return Status    Element Should Be Visible    id=stu.mySubjects.successAlert
    ${enrolled_table_present}=    Run Keyword And Return Status    Element Should Be Visible    id=stu.mySubjects.enrolledTable.Title
    ${database_systems_present}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath://td[text()='Database Systems']
    Close Browser

Teacher View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login    pedant    pass
    Navigate To    ${URL}/teacher-view/mySubjects
    Wait Until Page Contains    My Subjects
    ${students_text_correct}=    Run Keyword And Return Status    Element Text Should Be    id=tea.mySubjects.table.listOfStudentsButton-1    Students (0)
    Navigate To    ${URL}/teacher-view/myExamDates
    Wait Until Page Contains    My Exam Dates
    ${participants_text_correct}=    Run Keyword And Return Status    Element Text Should Be    id=tea.myExamDates.table.participantsButton-1-0    Participants (0/10)
    Navigate To    ${URL}/teacher-view/setEvaluation
    Wait Until Page Contains    Set Evaluation
    Select From List By Index    id=tea.setEvaluation.form.examTermDateSelect    1
    ${no_one_student_present}=    Run Keyword And Return Status    Element Should Be Visible    id=tea.setEvaluation.form.noOneStudent
    Navigate To    ${URL}/teacher-view/evaluationTable
    Wait Until Page Contains    Evaluation Table
    Select From List By Index    id=tea.evalTable.filter.subjectSelect    2
    Click Element    id=tea.evalTable.filter.submitButton
    ${no_students_text_present}=    Run Keyword And Return Status    Element Text Should Be    xpath://td[text()='No students on this exam date']    No students on this exam date
    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Click Element    id=header.link.login
    Input Text    id=loginPage.userNameInput    ${username}
    Press Key    id=loginPage.userNameInput    TAB
    Input Password    id=loginPage.passwordInput    ${password}
    Press Key    id=loginPage.passwordInput    ENTER