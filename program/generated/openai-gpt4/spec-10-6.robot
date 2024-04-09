*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Open Teacher Pages and Perform Checks
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Login    strict    pass
    My Subjects Page Checks
    My Exam Dates Page Check
    New Exam Dates Page Check
    Set Evaluation Page Check
    Evaluation Table Page Check
    Other's Subjects Page Check
    List of All Teachers Page Check
    [Teardown]    Close Browser

Login As Student and Check Other Subjects
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Login As Student    orange    pass
    Other Subjects Page Check For Student
    [Teardown]    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Login As Student
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

My Subjects Page Checks
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    ${is_disabled}=    Run Keyword And Return Status    Element Should Be Disabled    xpath=//button[@value="Remove"]
    Run Keyword If    ${is_disabled}    Log    All other remove buttons are disabled
    Sleep    1s
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    Sleep    1s

My Exam Dates Page Check
    Element Should Not Be Visible    xpath=//th[contains(text(),"Operating Systems")]

New Exam Dates Page Check
    Element Should Not Be Visible    xpath=//option[contains(text(),"Operating Systems")]

Set Evaluation Page Check
    Element Should Not Contain    xpath=//option    Operating Systems

Evaluation Table Page Check
    Element Should Not Be Visible    xpath=//option[contains(text(),"Operating Systems")]

Other's Subjects Page Check
    Element Should Be Visible    xpath=//td[contains(text(),"Operating Systems")]

List of All Teachers Page Check
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems

Other Subjects Page Check For Student
    ${os_present}=    Run Keyword And Return Status    Page Should Contain    Operating Systems
    ${peter_strict_not_present}=    Run Keyword And Return Status    Element Should Not Contain    xpath=//tr[contains(.,'Operating Systems')]    Peter Strict
    Run Keyword If    ${os_present} AND ${peter_strict_not_present}    Log    Correct validation for Operating Systems and Peter Strict