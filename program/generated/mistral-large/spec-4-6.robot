*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Browser}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student View
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Login    gray    pass
    Check Student View
    Close Browser

Teacher View
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Login    pedant    pass
    Check Teacher View
    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username}
    Press Key    xpath://*[@id="loginPage.userNameInput"]    \\13
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password}
    Press Key    xpath://*[@id="loginPage.passwordInput"]    \\13
    Sleep    2s

Check Student View
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.successAlert"]
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Be Visible    xpath://td[text()="Database Systems"]
    Sleep    2s

Check Teacher View
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    2s
    ${text}=    Get Text    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
    Should Be Equal    ${text}    Students (0)

    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s
    ${text}=    Get Text    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Should Be Equal    ${text}    Participants (0/10)

    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Select From List By Index    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]    1
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]

    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Select From List By Index    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    2
    Sleep    2s
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Element Should Be Visible    xpath://td[text()="No students on this exam date"]