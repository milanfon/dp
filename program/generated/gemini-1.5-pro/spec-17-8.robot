*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${BROWSER}    chrome
${DELAY}    2s

*** Keywords ***
Go To Page
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}

Login As Teacher
    Go To Page    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Login As Student
    Go To Page    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Check Other Subjects Teacher
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    ${DELAY}
    Location Should Be    http://localhost:4680/tbuis/teacher-view/otherSubjects
    Page Should Contain Element    id=tea.otherSubjects.successAlert

Check My Exam Dates Teacher
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://tr[@id="tea.myExamDates.table.noRecords-2" and contains(text(), "No exam dates.")]

Check New Exam Dates Teacher
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://option[contains(text(), "Linear Algebra")]

Check List of All Teachers Teacher
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(), "Linear Algebra")]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][contains(text(), "Alice Pedant")]

Check Other Subjects Student
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(text(), "Linear Algebra")]
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(text(), "Alice Pedant")]

*** Test Cases ***
Spec 17
    Login As Teacher
    Check Other Subjects Teacher
    Check My Exam Dates Teacher
    Check New Exam Dates Teacher
    Check List of All Teachers Teacher
    Close Browser
    Login As Student
    Check Other Subjects Student 
