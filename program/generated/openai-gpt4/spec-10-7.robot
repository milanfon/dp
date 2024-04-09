*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome

*** Test Cases ***
Perform Teacher Actions
    Open Browser To University System
    Perform Login Actions    ${teacher_username}    ${teacher_password}
    Verify And Interact With My Subjects
    Verify My Exam Dates Page
    Verify New Exam Dates Page
    Verify Set Evaluation Page
    Verify Evaluation Table Page
    Verify Others Subjects Page
    Verify List Of All Teachers Page
    Close Browser

Perform Student Actions
    Open Browser To University System
    Perform Login Actions    ${student_username}    ${student_password}
    Verify Other Subjects For Student
    Close Browser

*** Keywords ***
Open Browser To University System
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    1s

Perform Login Actions
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Verify And Interact With My Subjects
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    ${buttons_disabled}=    Run Keyword And Return Status    Element Should Be Disabled    xpath=//button[@value="Remove" and not(@id="tea.mySubjects.table.unregisterSubjectButton-0")]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    Sleep    1s

Verify My Exam Dates Page
    Element Should Not Be Visible    xpath=//th[contains(., "Operating Systems")]

Verify New Exam Dates Page
    Element Should Not Be Visible    xpath=//option[contains(., "Operating Systems")]

Verify Set Evaluation Page
    Element Should Not Contain    xpath=//option    Operating Systems

Verify Evaluation Table Page
    Element Should Not Be Visible    xpath=//option[contains(., "Operating Systems")]

Verify Others Subjects Page
    Element Should Be Visible    xpath=//td[contains(., "Operating Systems")]

Verify List Of All Teachers Page
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems

Verify Other Subjects For Student
    ${is_not_present}=    Run Keyword And Return Status    Element Should Not Contain    xpath=//tr[contains(., "Operating Systems")]    Peter Strict
    Run Keyword If    ${is_not_present}    Log    Peter Strict is not present with Operating Systems