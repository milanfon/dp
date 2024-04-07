*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}        http://localhost:4680/tbuis/index.jsp
${BROWSER}        Chrome

*** Test Cases ***
Student View
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    maroon
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Wait Until Page Contains    Student's View
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Wait Until Page Contains    Other Subjects
    Click Element    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Wait Until Page Contains Element    xpath://*[@id="stu.otherSubjects.successAlert"]
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Wait Until Page Contains    My Subjects
    Element Should Contain    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]    Software Quality Assurance
    Element Should Contain    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]    Peter Strict
    Close Browser

Teacher View
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    strict
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Wait Until Page Contains    Teacher's View
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains    My Subjects
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2)
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudents-3"]    William Maroon
    Close Browser