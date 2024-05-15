*** Settings ***
Library    Selenium2Library
Library    BuiltIn

*** Variables ***
${BROWSER}    Chrome
${DELAY}      2s

*** Test Cases ***
Student Enrolls in Subject and Appears in Teacher's List
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    maroon
    Press Keys    xpath=//*[@id="loginPage.passwordInput"]    RETURN
    Wait Until Page Contains Element    xpath=//*[@id="stu.menu.otherSubjects"]    ${DELAY}
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Wait Until Page Contains Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]    ${DELAY}
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Wait Until Page Contains Element    xpath=//*[@id="stu.otherSubjects.successAlert"]    ${DELAY}
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Wait Until Page Contains Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]    ${DELAY}
    Wait Until Page Contains Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Peter Strict"]    ${DELAY}
    Close Browser

    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"] 
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.mySubjects"]    ${DELAY}
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3" and text()="Students (2)"]    ${DELAY}
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Wait Until Page Contains Element    xpath=//td[text()="William Maroon"]    ${DELAY}
    [Teardown]    Close Browser