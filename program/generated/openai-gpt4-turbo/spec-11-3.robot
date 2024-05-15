*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SPEED}    2
${BROWSER}    Chrome

*** Test Cases ***
Navigate and Verify Multiple Actions
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Selenium Speed    ${SPEED}
    Set Window Size    1501    1104

    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    2s
    
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow

    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep    2s
    
    Page Should Contain    No students

    [Teardown]    Close Browser