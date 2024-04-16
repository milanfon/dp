*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Teacher Page
    Open Browser    ${url}    Chrome
    Set Viewport    1501    1104

    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2

    Input Text    xpath///*[@id="loginPage.userNameInput"]    scatterbrained
    Sleep    2

    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    2

    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2

    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Sleep    2

    Click Element    xpath///*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2

    Page Should Contain Element    xpath///*[@id="tea.myExamDates.successAlert"]

    Click Element    xpath///*[@id="tea.menu.setEvaluation"]
    Sleep    2

    Click Element    xpath///*[@id="tea.menu.evaluationTable"]
    Sleep    2

    Select From List by Index    xpath///*[@id="tea.evalTable.filter.subjectSelect"]    0
    Sleep    2

    Click Element    xpath///*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2
    Page Should Contain    No exam dates for this subject

    Close Browser

Open Student Page
    Open Browser    ${url}    Chrome
    Set Viewport    1501    1104

    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2

    Input Text    xpath///*[@id="loginPage.userNameInput"]    orange
    Sleep    2

    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    2

    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2

    Click Element    xpath///*[@id="stu.menu.myExamDates"]
    Sleep    2

    Page Should Not Contain    Computation Structures

    Close Browser