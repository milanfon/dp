*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680
${DELAY}       0

*** Test Cases ***
Teacher scenario
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]   1202
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}
    ${alert}    Get Alert Message
    Accept Alert
    Sleep    ${DELAY}
    ${is_visible}    Get Element Attribute    xpath://*[@id="tea.myExamDates.successAlert"]@visible
    Run Keyword If    ${is_visible}    Element Should Be Visible    xpath://*[@id="tea.myExamDates.successAlert"]    ${is_visible} should be False
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    ${is_visible}    Get Element Attribute    xpath://*[@id="tea.setEvaluation.form.noRecords"]@visible
    Run Keyword If    ${is_visible}    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noRecords"]    ${is_visible} should be True
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    ${is_visible}    Get Element Attribute    xpath://*[@id="tea.evalTable.noRecords"]@visible
    Run Keyword If    ${is_visible}    Element Should Be Visible    xpath://*[@id="tea.evalTable.noRecords"]    ${is_visible} should be True
    Close Browser

Student scenario
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    ${DELAY}
    ${is_visible}    Get Element Attribute    xpath://*[@id="stu.myExamDates.computationStructures"]@visible
    Run Keyword If    ${is_visible}    Element Should Not Be Visible    xpath://*[@id="stu.myExamDates.computationStructures"]    ${is_visible} should be False
    Close Browser