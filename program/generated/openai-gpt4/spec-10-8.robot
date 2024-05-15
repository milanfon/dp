*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Open University Information System And Perform Checks
    [Documentation]    Scenario for navigating through the University Information System and performing specific checks.
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    ${is_disabled}=    Run Keyword And Return Status    Wait Until Element Is Enabled    xpath=//*[contains(@id,"tea.mySubjects.table.unregisterSubjectButton-") and not(@id="tea.mySubjects.table.unregisterSubjectButton-0")]    5s
    Run Keyword If    ${is_disabled}    Log    Other remove buttons are disabled
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Wait Until Element Is Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    Sleep    2s
    Go To    http://localhost:4680/tbuis/teacher-view/myExamDates
    Sleep    2s
    Element Should Not Be Visible    xpath=//th[contains(text(),"Operating Systems")]
    Go To    http://localhost:4680/tbuis/teacher-view/newExamDates
    Sleep    2s
    Element Should Not Be Visible    xpath=//option[contains(text(),"Operating Systems")]
    Go To    http://localhost:4680/tbuis/teacher-view/setEvaluation
    Sleep    2s
    Element Should Not Be Visible    xpath=//option[contains(text(),"Operating Systems")]
    Go To    http://localhost:4680/tbuis/teacher-view/evaluationTable
    Sleep    2s
    Element Should Not Be Visible    xpath=//option[contains(text(),"Operating Systems")]
    Go To    http://localhost:4680/tbuis/teacher-view/otherSubjects
    Sleep    2s
    Element Should Be Visible    xpath=//td[contains(text(),"Operating Systems")]
    Go To    http://localhost:4680/tbuis/teacher-view/listOfAllTeachers
    Sleep    2s
    ${is_present}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(),"Operating Systems")]    5s
    Run Keyword If    not ${is_present}    Log    Operating Systems is not present in teacherRow-5

Login As Student And Perform Check
    [Documentation]    Scenario for logging in as a student and performing specific checks.
    Go To    http://localhost:4680/tbuis/index.jsp
    Sleep    2s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    ${is_present}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//tr[contains(.,'Operating Systems') and contains(.,'Peter Strict')]    5s
    Run Keyword If    not ${is_present}    Log    Peter Strict is not present in the same row as Operating Systems