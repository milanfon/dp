*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    about:blank    Chrome
Suite Teardown    Close Browser

*** Variables ***
${BASE_URL}    http://localhost:4680/tbuis

*** Test Cases ***
Teacher Scenario
    [Setup]    Login As Teacher
    Participate In Subject
    Check Participation Success
    Verify My Exam Dates
    Verify New Exam Dates Option
    Verify List Of All Teachers
    [Teardown]    Close Browser

Student Scenario
    [Setup]    Login As Student
    Verify Student Other Subjects
    [Teardown]    Close Browser

*** Keywords ***
Login As Teacher
    Go To    ${BASE_URL}/index.jsp
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Participate In Subject
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    2s

Check Participation Success
    Wait Until Element Is Visible    id=tea.otherSubjects.successAlert    5s

Verify My Exam Dates
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Page Should Contain    Linear Algebra
    Element Should Be Visible    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]

Verify New Exam Dates Option
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath=//option[contains(text(), 'Linear Algebra')]

Verify List Of All Teachers
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(),'Linear Algebra')]
    Element Text Should Match    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant

Login As Student
    Go To    ${BASE_URL}/index.jsp
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Verify Student Other Subjects
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(text(),'Linear Algebra')]
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(text(),'Alice Pedant')]