*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Unenrollment Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    gray
    Press Key    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    None    ENTER
    Sleep    3s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="stu.mySubjects.successAlert"]
    Page Should Contain Element    xpath=//*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Contain    xpath=//td    Database Systems
    Close Browser

Teacher Validation Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Press Key    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    None    ENTER
    Sleep    3s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    Element Text Should Be    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0)
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Element Text Should Be    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10)
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    1s
    Select From List By Index    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]    1
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    1s
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    2
    Sleep    1s
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    1s
    Element Should Contain    xpath=//td    No students on this exam date
    Close Browser