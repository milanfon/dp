*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome

*** Test Cases ***
Teacher Workflow
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="tea.otherSubjects.successAlert"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    1s
    Page Should Contain Element    xpath=//option[contains(text(), 'Linear Algebra')]
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    1s
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Close Browser

Student Workflow
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    yellow
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    1s
    Element Should Contain    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Should Contain    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Close Browser