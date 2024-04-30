*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${DELAY}          2s
${URL}            http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Login Student
    Click Link    xpath///*[@id="header.link.login"]
    Sleep         ${DELAY}
    Input Text    xpath///*[@id="loginPage.userNameInput"]    maroon
    Sleep         ${DELAY}
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep         ${DELAY}
    Submit Form

Login Teacher
    Click Link    xpath///*[@id="header.link.login"]
    Sleep         ${DELAY}
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Sleep         ${DELAY}
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep         ${DELAY}
    Submit Form

Go To Other Subjects Page
    Click Link    xpath///*[@id="stu.menu.otherSubjects"]
    Sleep         ${DELAY}

Go To My Subjects Page
    Click Link    xpath///*[@id="stu.menu.mySubjects"]
    Sleep         ${DELAY}

Go To Teacher My Subjects Page
    Click Link    xpath///*[@id="tea.menu.mySubjects"]
    Sleep         ${DELAY}

*** Test Cases ***
Enroll To Subject
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login Student
    Go To Other Subjects Page
    Click Element    xpath///*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep         ${DELAY}
    Page Should Contain Element    xpath///*[@id="stu.otherSubjects.successAlert"]
    Sleep         ${DELAY}
    Go To My Subjects Page
    Page Should Contain Element    xpath///*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Page Should Contain Element    xpath///*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()=" Peter Strict "]
    Sleep         ${DELAY}
    Close Browser

Check Students Enrolled To Subject
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login Teacher
    Go To Teacher My Subjects Page
    Page Should Contain Element    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3"][text()="Students (2) "]
    Click Element    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep         ${DELAY}
    Page Should Contain Element    xpath//td[text()="William Maroon"]
    Sleep         ${DELAY}
    Close Browser
