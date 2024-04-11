*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Unenrollment Process
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Sleep    2s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    gray
    Sleep    1s
    Press Keys    None    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Press Keys    None    ENTER
    Sleep    3s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    3s
    Click Element    xpath=//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="stu.mySubjects.successAlert"]
    Element Should Be Visible    xpath=//*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Be Visible    xpath=//td[text()="Database Systems"]
    Close Browser

Teacher Verification Process
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Sleep    2s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Sleep    1s
    Press Keys    None    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Press Keys    None    ENTER
    Sleep    3s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    ${studentsText}=    Get Text    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
    Should Be Equal As Strings    ${studentsText}    Students (0)
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    ${participantsText}=    Get Text    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Should Be Equal As Strings    ${participantsText}    Participants (0/10)
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Select From List By Index    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]    1
    Sleep    1s
    Element Should Be Visible    xpath=//*[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    2
    Sleep    1s
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Element Should Be Visible    xpath=//td[text()="No students on this exam date"]
    Close Browser