*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${BASE URL}       http://localhost:4680/tbuis/
${BROWSER}        chrome

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window

Login As Teacher
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s

Login As Student
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s

Check Others Subjects Page
    Click Link    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    1s
    Click Button    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    1s
    Location Should Be    ${BASE URL}teacher-view/otherSubjects
    Page Should Contain Element    id=tea.otherSubjects.successAlert
    Sleep    1s

Check My Exam Dates Page
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://tr[@id="tea.myExamDates.table.noRecords-2" and contains(., "No exam dates.")]
    Sleep    1s

Check New Exam Dates Page
    Click Link    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    1s
    Page Should Contain Element    xpath://option[contains(., "Linear Algebra")]
    Sleep    1s

Check List of All Teachers Page
    Click Link    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    1s
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(., "Linear Algebra")]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][contains(., "Alice Pedant")]
    Sleep    1s

*** Test Cases ***
Teacher Registers to Subject
    Open Login Page
    Login As Teacher
    Check Others Subjects Page
    Check My Exam Dates Page
    Check New Exam Dates Page
    Check List of All Teachers Page
    Close Browser

Student Sees the Subject
    Open Login Page
    Login As Student
    Click Link    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    1s
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(., "Linear Algebra")]
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(., "Alice Pedant")]
    Close Browser
