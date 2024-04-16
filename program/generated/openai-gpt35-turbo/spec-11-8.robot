*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}    2s

*** Test Cases ***
Example Test
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Viewport    1501    1104
    Sleep    ${DELAY}
    Click Element    xpath://*[contains(@id,"header.link.login")]
    Sleep    ${DELAY}
    Input Text    xpath://*[contains(@id,"loginPage.userNameInput")]    pedant
    Sleep    ${DELAY}
    Input Text    xpath://*[contains(@id,"loginPage.passwordInput")]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[contains(@id,"loginPage.loginFormSubmit")]
    Sleep    ${DELAY}
    Click Element    xpath://*[contains(@id,"tea.menu.mySubjects")]
    Sleep    ${DELAY}
    Click Element    xpath://*[contains(@id,"tea.mySubjects.table.listOfStudentsButton-0")]
    Sleep    ${DELAY}
    Click Element    id=closeModalButtonCross
    Sleep    ${DELAY}
    Click Element    xpath://*[contains(@id,"tea.mySubjects.table.listOfStudentsButton-2")]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[contains(text(),"No students")]
    Sleep    ${DELAY}
    Close Browser