*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${DELAY}          2s
${BROWSER}        chrome
${URL}            http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Open Browser And Navigate
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    2

Close Browser
    Close Browser

*** Test Cases ***
User can check students in their subjects
    Open Browser And Navigate
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Element Is Visible    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath://*[@id="tea.menu.mySubjects"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Wait Until Element Is Visible    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Wait Until Element Is Visible    xpath://*[@id="students.modal.table.firstName-0"]
    ${names}=    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    FOR    ${name}    IN    @{names}
        Page Should Contain Element    xpath://*[text()="${name}"]
    END
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Page Should Contain    No students
    Close Browser