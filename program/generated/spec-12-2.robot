*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test Teacher View
    [Setup]    Open Browser    about:blank    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]   1202
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    [Teardown]    Close Browser

Test Student View
    [Setup]    Open Browser    about:blank    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    [Teardown]    Close Browser

*** Keywords ***
Page Should Contain Text After Alert Accept
    [Arguments]    ${text}
    Accept Alert
    Page Should Contain Element    xpath://*[@id="${text}"]

Page Should Contain Text After Alert Accept And Element Should Be Visible
    [Arguments]    ${text}    ${element}
    Page Should Contain Text After Alert Accept    ${text}
    Element Should Be Visible    xpath://*[@id="${element}"]

Page Should Contain Text And Element Should Be Visible
    [Arguments]    ${text}    ${element}
    Page Should Contain Element    xpath://*[@id="${text}"]
    Element Should Be Visible    xpath://*[@id="${element}"]

Page Should Not Contain Text
    [Arguments]    ${text}
    Page Should Not Contain Element    xpath://*[@id="${text}"]

Page Should Contain Text After Element Should Be Visible
    [Arguments]    ${text}    ${element}
    Element Should Be Visible    xpath://*[@id="${element}"]
    Page Should Contain Element    xpath://*[@id="${text}"]

Page Should Contain Text After Element Should Be Visible And Element Should Be Visible
    [Arguments]    ${text}    ${element}    ${element2}
    Page Should Contain Text After Element Should Be Visible    ${text}    ${element}
    Element Should Be Visible    xpath://*[@id="${element2}"]