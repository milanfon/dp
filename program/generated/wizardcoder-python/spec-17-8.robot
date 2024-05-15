*** Settings ***
Library    SeleniumLibrary    run_on_failure=Close Browser

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}   0
${SELENIUM_LIBRARY_IMPORT}    True

*** Test Cases ***

Teacher Test
    [Tags]    Teacher
    Open Browser    ${URL}    ${BROWSER}
    Set Viewport Size    1501    104
    Set Selenium Speed    ${DELAY}
    Set Selenium Implicit Wait    10
    Teacher Login
    Teacher Check Exam Dates
    Teacher Check Teacher List
    Teacher Check New Exam Dates
    Teacher Check Others Subjects
    [Teardown]    Close Browser

Student Test
    [Tags]    Student
    Open Browser    ${URL}    ${BROWSER}
    Set Viewport Size    1501    104
    Set Selenium Speed    ${DELAY}
    Set Selenium Implicit Wait    10
    Student Login
    Student Check Others Subjects
    [Teardown]    Close Browser

Teacher Login
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Element Is Visible    xpath=//*[@id="loginPage.userNameInput"]    timeout=10
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath=//*[@id="tea.menu.otherSubjects"]    timeout=10

Teacher Check Others Subjects
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Wait Until Element Is Visible    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]    timeout=10
    Click Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Wait Until Element Is Visible    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]    timeout=10
    Element Should Be Visible    xpath=//*[@id="tea.otherSubjects.successAlert"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Wait Until Element Is Visible    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]    timeout=10
    Element Should Contain    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]    No exam dates.
    Element Should Contain    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]    Linear Algebra
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Wait Until Element Is Visible    xpath=//*[@id="tea.newExamDates.table.newExamDates"]//option    timeout=10
    Element Should Contain    xpath=//*[@id="tea.newExamDates.table.newExamDates"]//option    Linear Algebra
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Wait Until Element Is Visible    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]    timeout=10
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant

Student Login
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Element Is Visible    xpath=//*[@id="loginPage.userNameInput"]    timeout=10
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath=//*[@id="stu.menu.otherSubjects"]    timeout=10

Student Check Others Subjects
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Wait Until Element Is Visible    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]    timeout=10
    Element Should Contain    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Should Contain    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    [Teardown]    Close Browser 