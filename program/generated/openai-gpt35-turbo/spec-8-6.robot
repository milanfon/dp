*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/

*** Test Cases ***
Open Page and Check Elements
    Open Browser    ${URL}    Chrome
    Set Viewport    1501    1104
    Navigate    ${URL}
    Click Element    xpath///*[@id="header.link.login"]
    Click Element    xpath///*[@id="loginPage.userNameInput"]    offset=363.5
    Input Text    xpath///*[@id="loginPage.userNameInput"]    green
    Click Element    xpath///*[@id="loginPage.passwordInput"]    offset=300.5
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]    offset=41.5
    Click Element    xpath///*[@id="stu.menu.otherExamDates"]    offset=57.5
    Click Element    xpath///*[@id="stu.otherExamDates.table.registerButton-2-0"]    offset=31.3125
    Sleep    2s
    Page Should Contain Element    id=stu.otherExamDates.successAlert
    Click Element    xpath///*[@id="stu.menu.myExamDates"]    offset=162.5
    Sleep    2s
    Page Should Contain Element    xpath//td[contains(text(), "Programming in Java")]
    Close Browser

Login as Teacher and Check Elements
    Open Browser    ${URL}    Chrome
    Set Viewport    1501    1104
    Navigate    ${URL}
    Click Element    xpath///*[@id="header.link.login"]
    Click Element    xpath///*[@id="loginPage.userNameInput"]    offset=363.5
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath///*[@id="loginPage.passwordInput"]    offset=300.5
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]    offset=41.5
    Click Element    xpath///*[@id="tea.menu.myExamDates"]    offset=112.5
    Sleep    2s
    Page Should Contain Element    xpath//td[contains(text(), "Mia Orange")]
    Click Element    xpath///*[@id="tea.myExamDates.table.participantsButton-1-0"]    offset=37.484375
    Close Browser