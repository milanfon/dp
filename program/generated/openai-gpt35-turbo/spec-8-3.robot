*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/
${browser}        chrome

*** Test Cases ***
Open Page and Check Elements
    Open Browser    ${URL}    ${browser}
    Maximize Browser Window
    Sleep    2s

    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2s

    Input Text    xpath///*[@id="loginPage.userNameInput"]    green
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

    Element Should Contain    xpath//td[contains(text(), "Programming in Java")]

    Close Browser

Login as Teacher and Check Element
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${browser}
    Maximize Browser Window
    Sleep    2s

    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2s

    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Sleep    2s

    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    2s

    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Sleep    2s

    Click Element    xpath///*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s

    Element Should Contain    xpath//td[contains(text(), "Mia Orange")]

    Close Browser