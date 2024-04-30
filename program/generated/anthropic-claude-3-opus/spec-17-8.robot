*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Click Button    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Location Should Be    http://localhost:4680/tbuis/teacher-view/otherSubjects
    Page Should Contain Element    xpath=//*[@id="tea.otherSubjects.successAlert"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.table.noRecords-2" and contains(text(), "No exam dates.")]
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Page Should Contain Element    xpath=//option[contains(text(), "Linear Algebra")]
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Text Should Match    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Close Browser
    
Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window  
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    yellow
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Element Text Should Be    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Text Should Be    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Close Browser