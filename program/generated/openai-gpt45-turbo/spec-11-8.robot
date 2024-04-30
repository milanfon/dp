*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    2

*** Test Cases ***
Open Page And Validate Texts
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Element Should Contain    xpath=//body    Benjamin Green
    Element Should Contain    xpath=//body    Mia Orange
    Element Should Contain    xpath=//body    Charlotte Purple
    Element Should Contain    xpath=//body    Isabella Yellow
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Page Should Contain    No students
    Close Browser