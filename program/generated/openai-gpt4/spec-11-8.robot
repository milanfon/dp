*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Test Case
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${0}
    Click Element    xpath://*[@id='header.link.login']
    Input Text    xpath://*[@id='loginPage.userNameInput']    pedant
    Input Text    xpath://*[@id='loginPage.passwordInput']    pass
    Click Element    xpath://*[@id='loginPage.loginFormSubmit']
    Click Element    xpath://*[@id='tea.menu.mySubjects']
    Click Element    xpath://*[@id='tea.mySubjects.table.listOfStudentsButton-0']
    Click Element    xpath://*[@id='tea.mySubjects.table.listOfStudentsButton-2']
    Click Element    xpath://*[@id='closeModalButtonCross']
    ${names}=    Get WebElements    xpath://table[@id='tea.mySubjects.table.studentTable']//a
    ${list}=    Get Texts    ${names}
    @{expected}=    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    ${result}=    Compare Lists    ${list}    ${expected}
    Should Be Empty    ${result}
    Close Browser