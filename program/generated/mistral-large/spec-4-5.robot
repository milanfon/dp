*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login    gray    pass
    Click Element    xpath://a[contains(@id, 'stu.menu.mySubjects')]
    Wait Until Page Contains    My Subjects

    ${success_alert}    Run Keyword And Return Status    Page Should Contain Element    id=stu.mySubjects.successAlert
    Should Be True    ${success_alert}

    ${enrolled_table}    Run Keyword And Return Status    Page Should Contain Element    id=stu.mySubjects.enrolledTable.Title
    Should Be True    ${enrolled_table}

    ${database_systems}    Run Keyword And Return Status    Page Should Not Contain Element    xpath://td[contains(text(), 'Database Systems')]
    Should Be True    ${database_systems}

    Close Browser

Teacher View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login    pedant    pass
    Click Element    xpath://a[contains(@id, 'tea.menu.mySubjects')]
    Wait Until Page Contains    My Subjects

    ${list_of_students}    Get Text    id=tea.mySubjects.table.listOfStudentsButton-1
    Should Be Equal    ${list_of_students}    Students (0)

    Click Element    xpath://a[contains(@id, 'tea.menu.myExamDates')]
    Wait Until Page Contains    My Exam Dates

    ${participants}    Get Text    id=tea.myExamDates.table.participantsButton-1-0
    Should Be Equal    ${participants}    Participants (0/10)

    Click Element    xpath://a[contains(@id, 'tea.menu.setEvaluation')]
    Wait Until Page Contains    Set Evaluation

    Click Element    xpath://select[@id='tea.setEvaluation.form.examTermDateSelect']/option[2]
    ${no_one_student}    Run Keyword And Return Status    Page Should Contain Element    id=tea.setEvaluation.form.noOneStudent
    Should Be True    ${no_one_student}

    Click Element    xpath://a[contains(@id, 'tea.menu.evaluationTable')]
    Wait Until Page Contains    Evaluation Table

    Click Element    xpath://select[@id='tea.evalTable.filter.subjectSelect']/option[3]
    Click Element    id=tea.evalTable.filter.submitButton
    Wait Until Page Contains    No students on this exam date

    ${no_students}    Run Keyword And Return Status    Page Should Contain Element    xpath://td[contains(text(), 'No students on this exam date')]
    Should Be True    ${no_students}

    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Input Text    id=loginPage.userNameInput    ${username}
    Press Key    id=loginPage.userNameInput    TAB
    Input Text    id=loginPage.passwordInput    ${password}
    Press Key    id=loginPage.passwordInput    ENTER