*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student enrolls and teacher checks
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    maroon
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Submit Form
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="stu.otherSubjects.successAlert"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1]    Software Quality Assurance
    Sleep    2s
    Element Should Contain    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]    Peter Strict
    Sleep    2s
    Close Browser
    Sleep    5s
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Submit Form
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2) 
    Sleep    2s
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Element Should Contain    xpath://*[contains(text(),'William Maroon')]
    Sleep    2s
    Close Browser
