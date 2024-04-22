*** Settings ***
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${DELAY}          2

*** Test Cases ***
Enroll To Subject
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Sleep           ${DELAY}
    Click Element    xpath///*[@id="header.link.login"]
    Sleep           ${DELAY}
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep           ${DELAY}
    Input Text      xpath///*[@id="loginPage.userNameInput"]    maroon
    Sleep           ${DELAY}
    Press Keys      xpath///*[@id="loginPage.userNameInput"]    TAB
    Sleep           ${DELAY}
    Input Text      xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep           ${DELAY}
    Press Keys      xpath///*[@id="loginPage.passwordInput"]    ENTER
    Sleep           ${DELAY}
    Click Element    xpath///*[@id="stu.menu.otherSubjects"]
    Sleep           ${DELAY}
    Click Element    xpath///*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep           ${DELAY}
    Page Should Contain Element    xpath///*[@id="stu.otherSubjects.successAlert"]
    Sleep           ${DELAY}
    Click Element    xpath///*[@id="stu.menu.mySubjects"]
    Sleep           ${DELAY}
    Page Should Contain Element    xpath///*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]//td[text()="Software Quality Assurance"]
    Page Should Contain Element    xpath///*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]//td[text()=" Peter Strict "]

Teacher View
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Sleep           ${DELAY}
    Click Element    xpath///*[@id="header.link.login"]
    Sleep           ${DELAY}
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep           ${DELAY}
    Input Text      xpath///*[@id="loginPage.userNameInput"]    strict
    Sleep           ${DELAY}
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Sleep           ${DELAY}
    Input Text      xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep           ${DELAY}
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep           ${DELAY}
    Click Element    xpath///*[@id="tea.menu.mySubjects"]
    Sleep           ${DELAY}
    Element Text Should Be    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2) 
    Sleep           ${DELAY}
    Click Element    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep           ${DELAY}
    Page Should Contain Element    //td[text()="William Maroon"] 
