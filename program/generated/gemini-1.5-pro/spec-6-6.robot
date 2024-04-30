*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/index.jsp
${STUDENT USER}   maroon
${TEACHER USER}   strict
${PASSWORD}       pass

*** Test Cases ***
Student enrolls to subject and teacher sees student
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Link    xpath///*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    ${STUDENT USER}
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    2s
    Submit Form    xpath///*[@id="loginPage.loginForm"]
    Sleep    2s
    Click Link    xpath///*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Button    xpath///*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s
    Page Should Contain Element    xpath///*[@id="stu.otherSubjects.successAlert"]
    Sleep    2s
    Click Link    xpath///*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Page Should Contain Element    xpath///*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Sleep    2s
    Page Should Contain Element    xpath///*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()=" Peter Strict "]
    Sleep    2s
    Close Browser

Teacher sees enrolled student
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Link    xpath///*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    ${TEACHER USER}
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    2s
    Submit Form    xpath///*[@id="loginPage.loginForm"]
    Sleep    2s
    Click Link    xpath///*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Page Should Contain Button    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3" and text()="Students (2) "]
    Sleep    2s
    Click Button    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Page Should Contain Element    xpath///*[text()="William Maroon"]
    Sleep    2s
    Close Browser
