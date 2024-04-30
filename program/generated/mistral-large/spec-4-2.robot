*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Student View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login    gray    pass
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Check Presence    id=stu.mySubjects.successAlert
    Check Presence    id=stu.mySubjects.enrolledTable.Title
    Check Not Presence    xpath://td[text()="Database Systems"]
    Close Browser

Teacher View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login    pedant    pass
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Check Text    id=tea.mySubjects.table.listOfStudentsButton-1    Students (0)
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Check Text    id=tea.myExamDates.table.participantsButton-1-0    Participants (0/10)
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Select From List By Index    id=tea.setEvaluation.form.examTermDateSelect    1
    Check Presence    id=tea.setEvaluation.form.noOneStudent
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Select From List By Index    id=tea.evalTable.filter.subjectSelect    2
    Click Element    id=tea.evalTable.filter.submitButton
    Sleep    2s
    Check Presence    xpath://td[text()="No students on this exam date"]
    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Input Text    id=loginPage.userNameInput    ${username}
    Press Key    id=loginPage.userNameInput    TAB
    Input Text    id=loginPage.passwordInput    ${password}
    Press Key    id=loginPage.passwordInput    ENTER