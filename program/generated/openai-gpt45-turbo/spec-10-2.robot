*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}    http://localhost:4680/tbuis/login

*** Test Cases ***
Open University Information System And Perform Actions As Teacher
    Open Browser    ${URL}    ${BROWSER}
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
    Sleep    3s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    ${isDisabled}=    Run Keyword And Return Status    Element Should Be Disabled    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-1"]
    Run Keyword If    ${isDisabled}    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Element Should Not Contain    xpath=//th    Operating Systems
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Element Should Not Contain    xpath=//option    Operating Systems
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Element Should Not Contain    xpath=//option    Operating Systems
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Element Should Not Contain    xpath=//option    Operating Systems
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Element Should Contain    xpath=//td    Operating Systems
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td    Operating Systems
    Close Browser

Open University Information System And Perform Actions As Student
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Set Window Size    1501    1104
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
    Sleep    3s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    ${isNotPresent}=    Run Keyword And Return Status    Element Should Not Contain    xpath=//tr[contains(., 'Operating Systems')]    Peter Strict
    Run Keyword If    ${isNotPresent}    Log    Peter Strict is not in the same row as Operating Systems
    Close Browser