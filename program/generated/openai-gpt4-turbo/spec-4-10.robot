*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    gray
    Press Keys    None    TAB
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    None    ENTER
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="stu.mySubjects.successAlert"]
    Page Should Contain Element    xpath=//*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Contain    xpath=//td[text()="Database Systems"]    Database Systems
    Close Browser

Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Press Keys    None    TAB
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    None    ENTER
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0)
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Element Should Contain    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10)
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Select From List By Index    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]    1
    Page Should Contain Element    xpath=//*[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    2
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Element Should Contain    xpath=//td[text()="No students on this exam date"]    No students on this exam date
    Close Browser