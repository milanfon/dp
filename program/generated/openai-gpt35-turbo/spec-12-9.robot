*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}          1s

*** Test Cases ***
Open Page and Perform Actions as Teacher
    Open Browser    chrome
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false
    Navigate To     http://localhost:4680/tbuis/index.jsp
    Click Element    xpath///*[@id="header.link.login"]    ${DELAY}
    Input Text      xpath///*[@id="loginPage.userNameInput"]    scatterbrained    ${DELAY}
    Input Text      xpath///*[@id="loginPage.passwordInput"]    pass    ${DELAY}
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]    ${DELAY}
    Click Element    xpath///*[@id="tea.menu.myExamDates"]    ${DELAY}
    Click Element    xpath///*[@id="tea.myExamDates.table.cancelButton-0-0"]    ${DELAY}
    Alert Should Be Present And Accept    ${DELAY}
    Page Should Contain Element    xpath///*[@id="tea.myExamDates.successAlert"]    ${DELAY}
    Click Element    xpath///*[@id="tea.menu.setEvaluation"]    ${DELAY}
    Page Should Contain Element    xpath///*[@id="tea.setEvaluation.form.noRecords"]    ${DELAY}
    Click Element    xpath///*[@id="tea.menu.evaluationTable"]    ${DELAY}
    Select From List By Value    xpath///*[@id="tea.evalTable.filter.subjectSelect"]    1202    ${DELAY}
    Click Element    xpath///*[@id="tea.evalTable.filter.submitButton"]    ${DELAY}

    Close Browser

Perform Actions as Student
    Open Browser    chrome
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false
    Navigate To     http://localhost:4680/tbuis/index.jsp
    Click Element    xpath///*[@id="header.link.login"]    ${DELAY}
    Input Text      xpath///*[@id="loginPage.userNameInput"]    orange    ${DELAY}
    Input Text      xpath///*[@id="loginPage.passwordInput"]    pass    ${DELAY}
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]    ${DELAY}
    Click Element    xpath///*[@id="stu.menu.myExamDates"]    ${DELAY}
    Page Should Not Contain Element    Computation Structures    ${DELAY}

    Close Browser