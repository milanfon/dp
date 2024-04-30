Here is the Robot Framework code for the scenarios:

*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath:///*[@id="header.link.login"]
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    gray
    Press Keys    xpath:///*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath:///*[@id="loginPage.passwordInput"]    ENTER
    Wait Until Page Contains Element    xpath:///*[@id="stu.menu.mySubjects"]
    Click Element    xpath:///*[@id="stu.menu.mySubjects"]
    Wait Until Page Contains Element    xpath:///*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element    xpath:///*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Wait Until Page Contains Element    xpath:///*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Click Element    xpath:///*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    1s
    Page Should Contain Element    xpath:///*[@id="stu.mySubjects.successAlert"]
    Page Should Contain Element    xpath:///*[@id="stu.mySubjects.enrolledTable.Title"]
    Page Should Not Contain Element    xpath://td[contains(text(),'Database Systems')]
    Close Browser

Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath:///*[@id="header.link.login"]
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    pedant
    Press Keys    xpath:///*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath:///*[@id="loginPage.passwordInput"]    ENTER
    Wait Until Page Contains Element    xpath:///*[@id="tea.menu.mySubjects"]
    Click Element    xpath:///*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains Element    xpath:///*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
    Element Text Should Be    xpath:///*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0) 
    Click Element    xpath:///*[@id="tea.menu.myExamDates"]
    Wait Until Page Contains Element    xpath:///*[@id="tea.myExamDates.table.participantsButton-1-0"] 
    Element Text Should Be    xpath:///*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10) 
    Click Element    xpath:///*[@id="tea.menu.setEvaluation"]
    Wait Until Page Contains Element    xpath:///*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Select From List By Index    xpath:///*[@id="tea.setEvaluation.form.examTermDateSelect"]    1
    Page Should Contain Element    xpath:///*[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath:///*[@id="tea.menu.evaluationTable"]
    Wait Until Page Contains Element    xpath:///*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Index    xpath:///*[@id="tea.evalTable.filter.subjectSelect"]    2  
    Click Element    xpath:///*[@id="tea.evalTable.filter.submitButton"]
    Sleep    1s
    Page Should Contain Element    xpath://td[contains(text(),'No students on this exam date')]
    Close Browser