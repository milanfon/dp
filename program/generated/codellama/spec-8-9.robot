*** Variables ***
${BROWSER}  Chrome
${URL}  http://localhost:4680/tbuis/
${DELAY}  3 seconds

*** Test Cases ***
Spec 8 Student
    [Setup]  Open Browser  ${URL}  ${BROWSER}
    Click Element  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  green
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath://*[@id="stu.menu.otherExamDates"]
    Click Element  xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Element Should Be Visible  xpath://*[@id="stu.otherExamDates.successAlert"]
    Click Element  xpath://*[@id="stu.menu.myExamDates"]
    Element Should Be Visible  xpath://*[text()="Programming in Java"]
    Sleep  ${DELAY}
    Close Browser

Spec 8 Teacher
    [Setup]  Open Browser  ${URL}  ${BROWSER}
    Click Element  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath://*[@id="tea.menu.myExamDates"]
    Element Should Be Visible  xpath://*[text()="Mia Orange"]
    Sleep  ${DELAY}
    Close Browser