*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Check_Names_Presence
    Open Browser    ${URL}    chrome
    Set Selenium Speed    2
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0]
    Close Browser

Check_Students
    Open Browser    ${URL}    chrome
    Set Selenium Speed    2
    Click Element    id=closeModalButtonCross
    Wait Until Page Contains Element    id=tea.mySubjects.table.listOfStudentsButton-2
    Click Element    id=tea.mySubjects.table.listOfStudentsButton-2
    Wait Until Page Contains    No students
    Close Browser