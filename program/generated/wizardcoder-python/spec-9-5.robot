*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***

Check Exam Dates
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Sleep   2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep   2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Sleep   2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep   2s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep   2s
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep   2s
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep   2s
    Wait Until Element Is Visible    xpath://*[@id="stu.myExamDates.title"]
    Sleep   2s
    ${tds}=    Get Elements    xpath://td
    ${list}=    Get Length    ${tds}
    ${count}=    Set Variable    ${list}
    : FOR    ${i}    IN RANGE    0    ${list}
    \    ${text}=    Get Text    xpath://td[${i+1}]
    \    Run Keyword If    '${text}' == 'Benjamin Green' or '${text}' == 'Mia Orange' or '${text}' == 'Charlotte Purple' or '${text}' == 'Isabella Yellow'    Set Global Variable    ${found}    ${True}
    \    Exit For Loop If    '${found}' == 'True'
    \    ${count}=    Set Variable    ${count}
    Should Be True    ${found}    ${count} participants not found
    Close Browser