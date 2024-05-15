*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open page and perform actions as a teacher
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false
    
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Alert Should Be Present
    Handle Alert
    Location Should Be    http://localhost:4680/tbuis/teacher-view/myExamDates
    Page Should Contain Element    id=tea.myExamDates.successAlert

    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Page Should Contain Element    id=tea.setEvaluation.form.noRecords

    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Select From List By Index    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]

    Close Browser

Open page and perform actions as a student
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false

    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures

    Close Browser