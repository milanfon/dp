*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    .5s

*** Test Cases ***
Check Names
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep    ${DELAY}
    ${list}    Get WebElements    xpath=//*[@id="tea.mySubjects.table.listOfStudents"]//a
    ${length}    Get Length    ${list}
    Should Be True    ${length} > 0
    ${names}    Get Texts    ${list}
    Should Contain    ${names}    Benjamin Green
    Should Contain    ${names}    Mia Orange
    Should Contain    ${names}    Charlotte Purple
    Should Contain    ${names}    Isabella Yellow
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    ${DELAY}
    ${list}    Get WebElements    xpath=//*[@id="tea.mySubjects.table.listOfStudents"]//a
    ${length}    Get Length    ${list}
    Should Be True    ${length} == 0
    Should Contain    ${list}    No students
    Close Browser