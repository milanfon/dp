*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${DELAY}          1s

*** Test Cases ***
Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    maroon
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    ${DELAY}
    Page Should Contain Element    id=stu.otherSubjects.successAlert
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Page Should Contain Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Peter Strict"]
    Close Browser

Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Element Should Contain    id=tea.mySubjects.table.listOfStudentsButton-3    Students (2)
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//td[text()="William Maroon"]
    Close Browser