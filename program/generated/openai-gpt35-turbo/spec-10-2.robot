*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}          1s

*** Test Cases ***
Open Page and Validate Elements as Teacher
    Open Browser    chrome
    Set Viewport    1501    1104
    Navigate    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Sleep    ${DELAY}
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="tea.menu.newExamDates"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="tea.menu.otherSubjects"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    Close Browser

Log in as Student and Validate Elements
    Open Browser    chrome
    Set Viewport    1501    1104
    Navigate    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath///*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Sleep    ${DELAY}
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    Close Browser