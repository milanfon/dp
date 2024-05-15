*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Scenario 1
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Maximize Browser Window
    Sleep    1s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    maroon
    Sleep    1s
    Press Keys    xpath://*[@id="loginPage.userNameInput"]    TAB
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Press Keys    xpath://*[@id="loginPage.passwordInput"]    ENTER
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.successAlert"]
    Sleep    1s
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Page Should Contain Element    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[contains(text(), "Software Quality Assurance")]
    Page Should Contain Element    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[contains(text(), "Peter Strict")]
    Close Browser

Scenario 2
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Maximize Browser Window 
    Sleep    1s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    1s 
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Text Should Be    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2) 
    Sleep    1s
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    1s
    Page Should Contain Element    xpath://td[contains(text(), "William Maroon")]
    Close Browser
