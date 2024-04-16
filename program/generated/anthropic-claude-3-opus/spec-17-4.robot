*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Click Button    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.otherSubjects.successAlert"]
    Page Should Contain Element    xpath=//*[@id="tea.otherSubjects.successAlert"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Wait Until Page Contains    Linear Algebra
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.table.noRecords-2" and contains(., 'No exam dates.')]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Wait Until Page Contains Element    xpath=//option[contains(text(), 'Linear Algebra')]
    Sleep    1s 
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(., 'Linear Algebra')]
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Close Browser

Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    yellow  
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]  
    Wait Until Page Contains Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]
    Element Text Should Be    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Text Should Be    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Close Browser