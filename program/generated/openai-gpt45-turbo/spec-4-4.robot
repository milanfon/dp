*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Enrollment Scenario
    Open Chrome
    Set Viewport Size    1501    1104
    Go to page    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    gray
    Press Keys    None    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    None    ENTER
    Sleep    3s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="stu.mySubjects.successAlert"]
    Page Should Contain Element    xpath=//*[@id="stu.mySubjects.enrolledTable.Title"]
    Page Should Not Contain Element    xpath=//td[text()='Database Systems']
    Close Browser

Teacher Login and Checks
    Open Chrome
    Set Viewport Size    1501    1104
    Go to page    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Press Keys    None    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    None    ENTER
    Sleep    3s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0)
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Element Should Contain    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10)
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Select From List By Index    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]    1
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    2
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Element Should Contain    xpath=//td    No students on this exam date
    Close Browser

*** Keywords ***
Open Chrome
    Open Browser    about:blank    chrome
    Set Window Size    1501    1104

Go to page
    [Arguments]    ${url}
    Go To    ${url}