*** Settings ***
Library    SeleniumLibrary    plugins=Selenium2LibraryExtensions


*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    ${0}    # You can set the delay between steps here

*** Test Cases ***
Check Names
    Open Browser    ${URL}    ${BROWSER}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath=//*[@id="tea.menu.mySubjects"]    ${DELAY}
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Wait Until Element Is Visible    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]    ${DELAY}
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    ${students}    Get WebElements    xpath=//*[@id="tea.mySubjects.table.students"]//*[@class="name"]
    ${name1}    Get Text    ${students[0]//*[1]//a}
    ${name2}    Get Text    ${students[1]//*[1]//a}
    ${name3}    Get Text    ${students[2]//*[1]//a}
    ${name4}    Get Text    ${students[3]//*[1]//a}
    Should Be Equal    ${name1}    Benjamin Green
    Should Be Equal    ${name2}    Mia Orange
    Should Be Equal    ${name3}    Charlotte Purple
    Should Be Equal    ${name4}    Isabella Yellow
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Wait Until Element Contains    xpath=//*[@id="tea.mySubjects.table.students"]    No students
    [Teardown]    Close Browser