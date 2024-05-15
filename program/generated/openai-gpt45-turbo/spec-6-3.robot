*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    maroon
    Press Keys    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    None    ENTER
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="stu.otherSubjects.successAlert"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Table Should Contain    xpath=//*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]    Software Quality Assurance
    Table Should Contain    xpath=//*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]    Peter Strict
    Close Browser

Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2) 
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Table Should Contain    xpath=//td    William Maroon
    Close Browser

*** Keywords ***
Table Should Contain
    [Arguments]    ${locator}    ${content}
    ${cell_elements}=    Get WebElements    ${locator}//td
    ${found}=    Set Variable    ${FALSE}
    FOR    ${element}    IN    @{cell_elements}
        ${text}=    Get Text    ${element}
        Run Keyword If    '${text}'=='${content}'    Set Variable    ${TRUE}
    END
    Should Be True    ${found}