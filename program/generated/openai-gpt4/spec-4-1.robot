*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Open Student Page And Verify Elements
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    gray
    Sleep    1s
    Press Keys    None    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    \\13
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="stu.mySubjects.successAlert"]
    Element Should Be Visible    xpath=//*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Be Visible    xpath=//td[contains(text(), "Database Systems")]
    Close Browser

Open Teacher Page And Verify Elements
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Sleep    1s
    Press Keys    None    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    \\13
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    text=Students (0) 
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]    text=Participants (0/10) 
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    1s
    Select From List By Index    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]    2
    Sleep    1s
    Element Should Be Visible    xpath=//*[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    1s
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    3
    Sleep    1s
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    1s
    Element Should Be Visible    xpath=//td[contains(text(), "No students on this exam date")]
    Close Browser