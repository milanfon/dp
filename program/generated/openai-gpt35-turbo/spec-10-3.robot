*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}          1s

*** Test Cases ***
Open Page and Verify Elements as Teacher
    Open Browser    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Navigate To    http://localhost:4680/tbuis/index.jsp
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Sleep    ${DELAY}
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
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

Login as Student and Verify Elements
    Open Browser    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Navigate To    http://localhost:4680/tbuis/index.jsp
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath///*[@id="loginPage.userNameInput"]    orange
    Sleep    ${DELAY}
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    Close Browser