*** Settings ***
Library           SeleniumLibrary
Documentation     Teacher unregister subject

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/index.jsp
${TEACHER USER}   strict
${TEACHER PASS}   pass
${STUDENT USER}   orange
${STUDENT PASS}   pass


*** Test Cases ***
Teacher Unregister Subject
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${TEACHER USER}
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${TEACHER PASS}
    Sleep    2s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Link    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0" and @disabled]
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-1" and @disabled]
    Click Button    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.successAlert"]
    Sleep    2s
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain Element    xpath://*[(text() = 'Operating Systems') and (@role="columnheader")]
    Sleep    2s
    Click Link    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Page Should Not Contain Element    xpath://*[@id="tea.newExamDates.subjectSelect"]//option[text()='Operating Systems']
    Sleep    2s
    Click Link    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Page Should Not Contain Element    xpath://*[@id="tea.setEvaluation.subjectSelect"]//option[contains(text(),'Operating Systems')]
    Sleep    2s
    Click Link    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Page Should Not Contain Element    xpath://*[@id="tea.evaluationTable.subjectSelect"]//option[text()='Operating Systems']
    Sleep    2s
    Click Link    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Page Should Contain Element    xpath://td[text()='Operating Systems']
    Sleep    2s
    Click Link    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Page Should Not Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(),'Operating Systems')]
    Sleep    2s
    Close Browser

Student Check Other Subjects
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${STUDENT USER}
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${STUDENT PASS}
    Sleep    2s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Link    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Page Should Not Contain Element    xpath://tr[td[text()='Operating Systems'] and td[contains(text(),'Peter Strict')]]
    Sleep    2s
    Close Browser 
