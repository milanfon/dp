*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://localhost:4680/tbuis/

*** Test Cases ***
Open Page and Check Elements
    Open Browser  ${URL}  chrome
    Maximize Browser Window
    Set Viewport  1501  1104  1  False  False  False
    Click Element  xpath///*[@id="header.link.login"]
    Sleep  2s
    Input Text  xpath///*[@id="loginPage.userNameInput"]  green
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep  2s
    Click Element  xpath///*[@id="stu.menu.otherExamDates"]
    Sleep  2s
    Click Element  xpath///*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep  2s
    Click Element  xpath///*[@id="stu.menu.myExamDates"]
    Sleep  2s
    Page Should Contain Element  xpath//td[contains(text(), "Programming in Java")]
    Close Browser

Login as Teacher and Check Element
    Open Browser  http://localhost:4680/tbuis/index.jsp  chrome
    Maximize Browser Window
    Set Viewport  1501  1104  1  False  False  False
    Click Element  xpath///*[@id="header.link.login"]
    Sleep  2s
    Input Text  xpath///*[@id="loginPage.userNameInput"]  strict
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep  2s
    Click Element  xpath///*[@id="tea.menu.myExamDates"]
    Sleep  2s
    Click Element  xpath///*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep  2s
    Page Should Contain Element  xpath//td[contains(text(), "Mia Orange")]
    Close Browser