*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    chrome    http://localhost:4680/tbuis/index.jsp
Suite Teardown    Close Browser

*** Test Cases ***
Teacher Login
    Set Browser Implicit Wait    10
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Wait Until Element Is Visible    id:tea.otherSubjects.successAlert
    Page Should Contain    Linear Algebra
    Element Should Contain    xpath://*[@id="tea.myExamDates.table.noRecords-2"]    No exam dates.
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Element Should Contain    xpath://*[@option="Linear Algebra"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Sleep    2
    Close Browser

Student Login
    Open Browser    chrome    http://localhost:4680/tbuis/index.jsp
    Set Browser Implicit Wait    10
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Element Should Contain    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Should Contain    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Sleep    2
    Close Browser