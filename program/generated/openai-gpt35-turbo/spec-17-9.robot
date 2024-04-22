*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Example Test
    Open Browser    ${url}    chrome
    Set Viewport    1501    1104
    Delay           1s

    Click Element    xpath///*[@id="header.link.login"]
    Delay           1s

    Input Text      xpath///*[@id="loginPage.userNameInput"]    pedant
    Delay           1s

    Input Text      xpath///*[@id="loginPage.passwordInput"]    pass
    Delay           1s

    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Delay           2s

    Click Element    xpath///*[@id="tea.menu.otherSubjects"]
    Delay           1s

    Click Element    xpath///*[@id="tea.otherSubjects.table.participateButton-3"]
    Delay           2s

    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Delay           1s

    Click Element    xpath///*[@id="tea.menu.newExamDates"]
    Delay           1s

    Click Element    xpath///*[@id="tea.menu.listOfAllTeachers"]
    Delay           1s

    Close Browser

Student Test
    Open Browser    ${url}    chrome
    Set Viewport    1501    1104
    Delay           1s

    Click Element    xpath///*[@id="header.link.login"]
    Delay           1s

    Input Text      xpath///*[@id="loginPage.userNameInput"]    yellow
    Delay           1s

    Input Text      xpath///*[@id="loginPage.passwordInput"]    pass
    Delay           1s

    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Delay           2s

    Click Element    xpath///*[@id="stu.menu.otherSubjects"]
    Delay           1s

    Close Browser