*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp
${DELAY}    5s

*** Test Cases ***
Spec 6 Student
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    maroon
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Click Element    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="stu.otherSubjects.successAlert"]
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    ${DELAY}
    ${td}    Get Webelement    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]
    ${td_text}    Get Text    ${td}
    Should Contain    ${td_text}    Software Quality Assurance
    Should Contain    ${td_text}    Peter Strict
    Close Browser

Spec 6 Teacher
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    ${button}    Get Webelement    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    ${button_text}    Get Text    ${button}
    Should Contain    ${button_text}    Students (2) 
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[text()="William Maroon"]
    Close Browser

*** Keywords ***
Sleep And Close Browser
    Sleep    ${DELAY}
    Close Browser