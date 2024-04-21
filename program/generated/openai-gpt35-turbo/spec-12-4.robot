*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Accept Alert
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Delay    1s
    Click Element    xpath///*[@id="header.link.login"]
    Delay    1s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Delay    2s
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Delay    1s
    Click Element    xpath///*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Alert Should Be Present
    Handle Alert
    Page Should Contain Element    id=tea.myExamDates.successAlert
    Close Browser

Check Set Evaluation Page
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Delay    1s
    Click Element    xpath///*[@id="header.link.login"]
    Delay    1s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Delay    2s
    Click Element    xpath///*[@id="tea.menu.setEvaluation"]
    Page Should Contain Element    id=tea.setEvaluation.form.noRecords
    Close Browser

Check Evaluation Table Page
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Delay    1s
    Click Element    xpath///*[@id="header.link.login"]
    Delay    1s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Delay    2s
    Click Element    xpath///*[@id="tea.menu.evaluationTable"]
    Select From List by Value    xpath///*[@id="tea.evalTable.filter.subjectSelect"]    -1
    Select From List by Value    xpath///*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Click Element    xpath///*[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain    No exam dates for this subject
    Close Browser

Check Student View
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Delay    1s
    Click Element    xpath///*[@id="header.link.login"]
    Delay    1s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Delay    2s
    Click Element    xpath///*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures
    Close Browser