*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${url}    http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Login As Teacher
    Sleep    2s
    Open Browser    ${url}    chrome
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Login As Student
    Sleep    2s
    Open Browser    ${url}    chrome
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

*** Test Cases ***
Teacher Join Subject
    Login As Teacher
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Location Should Be    http://localhost:4680/tbuis/teacher-view/otherSubjects
    Element Should Be Visible    xpath://*[@id="tea.otherSubjects.successAlert"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Page Should Contain Element    xpath://*[@id="newExamDatesForm.subject"]/option[text()="Linear Algebra"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][text()="Linear Algebra"]
    Element Text Should Match    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant

Student See Teacher
    Login As Student
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Element Text Should Match    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Text Should Match    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
