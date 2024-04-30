*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Process
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    maroon
    Press Keys    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Sleep    2s  # Wait for navigation
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.successAlert"]
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    1s
    Element Should Contain    xpath=//tr[@id='stu.mySubjects.enrolledTable.subjectRow-2']/td    Software Quality Assurance
    Element Should Contain    xpath=//tr[@id='stu.mySubjects.enrolledTable.subjectRow-2']/td    Peter Strict
    Close Browser

Teacher Process
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s  # Wait for navigation
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2)
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    1s
    Page Should Contain Element    xpath=//td[text()='William Maroon']
    Close Browser