*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Login to the University Information System
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    pedant
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    aria/My Subjects
    Click Button    aria/Students (4)[role="button"]
    Click Button    id:closeModalButtonCross
    Click Button    id:tea.mySubjects.table.listOfStudentsButton-2
    ${names}=    Get WebElements    xpath://*[contains(@class, 'tea.mySubjects.table.listOfStudents-name')]
    ${names_list}=    Get Texts    ${names}
    Should Contain    ${names_list}    Benjamin Green
    Should Contain    ${names_list}    Mia Orange
    Should Contain    ${names_list}    Charlotte Purple
    Should Contain    ${names_list}    Isabella Yellow
    Close Browser