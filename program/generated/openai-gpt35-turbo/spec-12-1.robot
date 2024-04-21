*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Wait Until Page Contains    University information system
    Click Element    xpath///*[@id="header.link.login"]
    Wait Until Page Contains    Login Page
    Input Text    xpath///*[@id="loginPage.userNameInput"]    scatterbrained
    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    Teacher's View
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Wait Until Page Contains    Teacher's View
    Click Element    xpath///*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Wait Until Alert Is Present
    Handle Alert
    Wait Until Page Contains Element    xpath///*[@id="tea.myExamDates.successAlert"]
    Click Element    xpath///*[@id="tea.menu.setEvaluation"]
    Wait Until Page Contains    Teacher's View
    Click Element    xpath///*[@id="tea.menu.evaluationTable"]
    Wait Until Page Contains    Teacher's View
    Select From List By Value    xpath///*[@id="tea.evalTable.filter.subjectSelect"]    -1
    Click Element    xpath///*[@id="tea.evalTable.filter.submitButton"]
    Wait Until Page Contains    Teacher's View
    Close Browser

Student Scenario
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Wait Until Page Contains    University information system
    Click Element    xpath///*[@id="header.link.login"]
    Wait Until Page Contains    Login Page
    Input Text    xpath///*[@id="loginPage.userNameInput"]    orange
    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    Student's View
    Click Element    xpath///*[@id="stu.menu.myExamDates"]
    Wait Until Page Contains    Student's View
    Wait Until Element Is Not Visible    Computation Structures
    Close Browser