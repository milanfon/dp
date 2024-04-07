*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${DELAY}    10000

*** Test Cases ***
Student scenario
    Open browser    http://localhost:4680/tbuis/index.jsp    browser=Chrome
    Input text    id:loginPage.userNameInput    maroon
    Input text    id:loginPage.passwordInput    pass
    Click button    id:loginPage.loginFormSubmit
    Click link    aria:Other Subjects
    Click button    id:stu.otherSubjects.table.enrollButton-10
    ${is_enroll_successful}=    is element visible    id:stu.otherSubjects.successAlert
    Should be true    ${is_enroll_successful}
    Click link    aria:My Subjects
    ${is_enroll_successful}=    is element visible    id:stu.mySubjects.enrolledTable.subjectRow-2
    Should be true    ${is_enroll_successful}
    Click link    aria:My Subjects
    ${is_enroll_successful}=    is element visible    id:stu.mySubjects.enrolledTable.subjectRow-2    xpath=//td[text()='Software Quality Assurance']    xpath=//td[text()='Peter Strict']
    Should be true    ${is_enroll_successful}
    Close all browsers

Teacher scenario
    Open browser    http://localhost:4680/tbuis/index.jsp    browser=Chrome
    Input text    id:loginPage.userNameInput    strict
    Input text    id:loginPage.passwordInput    pass
    Click button    id:loginPage.loginFormSubmit
    Click link    aria:My Subjects
    Click button    id:tea.mySubjects.table.listOfStudentsButton-3
    ${teacher_students}=    get text    id:tea.mySubjects.table.listOfStudentsButton-3
    Should be equal    ${teacher_students}    Students (2)
    ${is_student_enrolled}=    is element visible    xpath=//td[text()='William Maroon']
    Should be true    ${is_student_enrolled}
    Close all browsers