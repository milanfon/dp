*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/

*** Test Cases ***
Open Page and Check Elements
    Open Browser    ${URL}    chrome
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false

    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2s

    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    green
    Sleep    2s

    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    2s

    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

    Click Element    xpath///*[@id="stu.menu.otherExamDates"]
    Sleep    2s

    Click Element    xpath///*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s

    Click Element    xpath///*[@id="stu.menu.myExamDates"]
    Sleep    2s

    Close Browser

Login as Teacher and Check Elements
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false

    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2s

    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Sleep    2s

    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    2s

    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Sleep    2s

    Click Element    xpath///*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s

    Close Browser