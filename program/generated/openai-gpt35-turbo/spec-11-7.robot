*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}    2s

*** Test Cases ***
Check_Names_Presence
    Set Selenium Speed    2
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Wait Until Page Contains Element    xpath://*[@id="header.link.login"]    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath://*[@id="loginPage.userNameInput"]    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Wait Until Page Contains Element    xpath://*[@id="loginPage.passwordInput"]    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Wait Until Page Contains Element    xpath://*[@id="loginPage.loginFormSubmit"]    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath://*[@id="tea.menu.mySubjects"]    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]    ${DELAY}
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Wait Until Page Contains Element    xpath://*[@id="closeModalButtonCross"]    ${DELAY}
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Wait Until Page Contains Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]    ${DELAY}
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Wait Until Page Contains    No students
    Close Browser

Check_Students_Text
    Set Selenium Speed    2
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Wait Until Page Contains Element    xpath://*[@id="header.link.login"]    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath://*[@id="loginPage.userNameInput"]    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Wait Until Page Contains Element    xpath://*[@id="loginPage.passwordInput"]    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Wait Until Page Contains Element    xpath://*[@id="loginPage.loginFormSubmit"]    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath://*[@id="tea.menu.mySubjects"]    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]    ${DELAY}
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Wait Until Page Contains Element    xpath://*[@id="closeModalButtonCross"]    ${DELAY}
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Wait Until Page Contains Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]    ${DELAY}
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Wait Until Page Contains    No students
    Close Browser