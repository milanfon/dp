*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}    http://localhost:4680/tbuis/login
${USER_NAME}    maroon
${USER_PASS}    pass
${BROWSER}    Chrome

*** Test Cases ***
Check Student Enrollment
    [Setup]    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    id=loginPage.userNameInput    ${USER_NAME}
    Input Text    id=loginPage.passwordInput    ${USER_PASS}
    Click Element    id=loginPage.loginFormSubmit
    Click Element    id=stu.menu.otherSubjects
    Click Element    id=stu.otherSubjects.table.enrollButton-10
    ${enroll_alert}    Get WebElement    id=stu.otherSubjects.successAlert
    Should Be True    ${enroll_alert.is_displayed()}
    Click Element    id=stu.menu.mySubjects
    ${enrolled_row}    Get WebElement    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]
    ${enrolled_subject}    Get WebElement    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1]
    ${enrolled_teacher}    Get WebElement    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]
    Should Be Equal    ${enrolled_subject.text}    Software Quality Assurance
    Should Be Equal    ${enrolled_teacher.text}    Peter Strict
    Close Browser

Check Teacher Students
    [Setup]    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    id=loginPage.userNameInput    strict
    Input Text    id=loginPage.passwordInput    pass
    Click Element    id=loginPage.loginFormSubmit
    Click Element    id=tea.menu.mySubjects
    ${students_button}    Get WebElement    id=tea.mySubjects.table.listOfStudentsButton-3
    ${students_button_text}    Get WebElement    id=tea.mySubjects.table.listOfStudentsButton-3
    Should Be Equal    ${students_button_text.text}    Students (2)
    Click Element    id=tea.mySubjects.table.listOfStudentsButton-3
    ${students_table}    Get WebElement    id=tea.mySubjects.studentsTable
    ${student_name}    Get WebElement    ${students_table}//td[.="William Maroon"]
    Should Be True    ${student_name.is_displayed()}
    Close Browser