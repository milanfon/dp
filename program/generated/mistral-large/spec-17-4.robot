*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${BROWSER}        Chrome
${DELAY}          2s
${USERNAME_TEACHER}    pedant
${PASSWORD_TEACHER}    pass
${USERNAME_STUDENT}    yellow
${PASSWORD_STUDENT}    pass

*** Test Cases ***
Teacher Scenario
    Open Browser To Teacher View
    Login As Teacher
    Click Element    xpath://a[text()='Others' Subjects']
    Sleep    ${DELAY}
    Click Element    xpath://button[contains(@id, 'participateButton')]
    Sleep    ${DELAY}
    Check If Still On Others Subjects Page And Success Alert Is Visible
    Click Element    xpath://a[text()='My Exam Dates']
    Sleep    ${DELAY}
    Check My Exam Dates Page
    Click Element    xpath://a[text()='New Exam Dates']
    Sleep    ${DELAY}
    Check New Exam Dates Page
    Click Element    xpath://a[text()='List of All Teachers']
    Sleep    ${DELAY}
    Check List Of All Teachers Page
    Close Browser

Student Scenario
    Open Browser To Student View
    Login As Student
    Click Element    xpath://a[text()='Other Subjects']
    Sleep    ${DELAY}
    Check Other Subjects Page
    Close Browser

*** Keywords ***
Open Browser To Teacher View
    Open Browser    ${URL}    ${BROWSER}

Open Browser To Student View
    Open Browser    ${URL}    ${BROWSER}

Login As Teacher
    Input Text      xpath://input[@id='loginPage.userNameInput']    ${USERNAME_TEACHER}
    Input Text      xpath://input[@id='loginPage.passwordInput']    ${PASSWORD_TEACHER}
    Click Element    xpath://button[contains(@id, 'loginFormSubmit')]

Login As Student
    Input Text      xpath://input[@id='loginPage.userNameInput']    ${USERNAME_STUDENT}
    Input Text      xpath://input[@id='loginPage.passwordInput']    ${PASSWORD_STUDENT}
    Click Element    xpath://button[contains(@id, 'loginFormSubmit')]

Check If Still On Others Subjects Page And Success Alert Is Visible
    Location Should Be    http://localhost:4680/tbuis/teacher-view/otherSubjects
    Page Should Contain Element    xpath://*[@id='tea.otherSubjects.successAlert']

Check My Exam Dates Page
    Location Should Be    http://localhost:4680/tbuis/teacher-view/myExamDates
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://tr[@id='tea.myExamDates.table.noRecords-2']
    Page Should Contain    No exam dates.

Check New Exam Dates Page
    Location Should Be    http://localhost:4680/tbuis/teacher-view/newExamDates
    Page Should Contain Element    xpath://option[text()='Linear Algebra']

Check List Of All Teachers Page
    Location Should Be    http://localhost:4680/tbuis/teacher-view/listOfAllTeachers
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(., 'Linear Algebra')]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][contains(., 'Alice Pedant')]

Check Other Subjects Page
    Location Should Be    http://localhost:4680/tbuis/student-view/otherSubjects
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(., 'Linear Algebra')]
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(., 'Alice Pedant')]