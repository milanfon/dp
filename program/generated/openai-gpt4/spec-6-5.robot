*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${DELAY}          1s

*** Test Cases ***
Student Enrolls In Other Subjects And Checks My Subjects Page
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    maroon
    Press Key    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    ${DELAY}
    Wait Until Element Is Visible    id=stu.otherSubjects.successAlert    10s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    ${DELAY}
    Wait Until Element Is Visible    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]    10s
    Page Should Contain Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Peter Strict"]
    Close Browser

Teacher Verifies Student Enrollment
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Press Key    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Element Should Contain    id=tea.mySubjects.table.listOfStudentsButton-3    Students (2)
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    ${DELAY}
    Wait Until Element Is Visible    xpath=//td[text()="William Maroon"]    10s
    Close Browser