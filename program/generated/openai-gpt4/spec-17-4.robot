*** Settings ***
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="tea.otherSubjects.successAlert"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Element Should Contain    xpath=//option    Linear Algebra
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant

Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    yellow
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Element Should Contain    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Should Contain    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant