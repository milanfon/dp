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
    Input Text    id=loginPage.passwordInput    pass
    Press Key    id=loginPage.passwordInput    ENTER
    Wait Until Page Contains    Student's View
    Click Element    xpath//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    ${success_alert_present}=    Run Keyword And Return Status    Page Should Contain Element    id=stu.mySubjects.successAlert
    ${enrolled_table_present}=    Run Keyword And Return Status    Page Should Contain Element    id=stu.mySubjects.enrolledTable.Title
    ${database_systems_present}=    Run Keyword And Return Status    Page Should Not Contain Element    xpath//td[text()='Database Systems']
    Close Browser

Teacher View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=loginPage.userNameInput    pedant
    Input Text    id=loginPage.passwordInput    pass
    Press Key    id=loginPage.passwordInput    ENTER
    Wait Until Page Contains    Teacher's View
    Click Element    xpath//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    ${list_of_students_text}=    Get Text    id=tea.mySubjects.table.listOfStudentsButton-1
    Should Be Equal    ${list_of_students_text}    Students (0)
    Click Element    xpath//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    ${participants_text}=    Get Text    id=tea.myExamDates.table.participantsButton-1-0
    Should Be Equal    ${participants_text}    Participants (0/10)
    Click Element    xpath//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Click Element    xpath//*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Select From List By Index    id=tea.setEvaluation.form.examTermDateSelect    1
    Sleep    2s
    ${no_one_student_present}=    Run Keyword And Return Status    Page Should Contain Element    id=tea.setEvaluation.form.noOneStudent
    Click Element    xpath//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Click Element    xpath//*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Index    id=tea.evalTable.filter.subjectSelect    2
    Click Element    xpath//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    ${no_students_present}=    Run Keyword And Return Status    Page Should Contain Element    xpath//td[text()='No students on this exam date']
    Close Browser