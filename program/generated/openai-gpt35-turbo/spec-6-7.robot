*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student Scenario
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    maroon
    Press Keys    xpath///*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath///*[@id="loginPage.passwordInput"]    ENTER
    Click Element    xpath///*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath///*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s
    Click Element    xpath///*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Close Browser

Teacher Scenario
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Click Element    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Close Browser