*** Settings ***
Documentation     Verification of teacher functionalities in the University Information System.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${DELAY}          2s

*** Test Cases ***
Participate In Others' Subjects And Verification
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    Login    pedant    pass
    Go To Others' Subjects And Participate
    Verify On Others' Subjects Page With Success Alert
    Verify My Exam Dates Page
    Verify New Exam Dates Page
    Verify List Of All Teachers Page
    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Go To Others' Subjects And Participate
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    ${DELAY}

Verify On Others' Subjects Page With Success Alert
    Page Should Contain Element    id=tea.otherSubjects.successAlert

Verify My Exam Dates Page
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]

Verify New Exam Dates Page
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//option[contains(text(),'Linear Algebra')]

Verify List Of All Teachers Page
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(.,'Linear Algebra')]
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][contains(.,'Alice Pedant')]
