*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Accept Alert
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    scatterbrained
    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Click Element    xpath///*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Alert Should Be Present
    Handle Alert    Accept
    Page Should Contain Element    id=tea.myExamDates.successAlert
    Close Browser

Check Evaluation Table
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    orange
    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures
    Close Browser