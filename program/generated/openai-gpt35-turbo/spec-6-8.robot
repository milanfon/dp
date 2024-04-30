*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
spec 6 student
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Sleep    2s

    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2s

    Input Text    xpath///*[@id="loginPage.userNameInput"]    maroon
    Press Keys    xpath///*[@id="loginPage.userNameInput"]    TAB
    Press Keys    xpath///*[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath///*[@id="loginPage.passwordInput"]    ENTER
    Sleep    2s

    Click Element    xpath///*[@id="stu.menu.otherSubjects"]
    Sleep    2s

    Click Element    xpath///*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s

    Click Element    xpath///*[@id="stu.menu.mySubjects"]
    Sleep    2s

    Close Browser

spec 6 teacher
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Sleep    2s

    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2s

    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

    Click Element    xpath///*[@id="tea.menu.mySubjects"]
    Sleep    2s

    Click Element    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s

    Close Browser