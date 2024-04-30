*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser To Page
Test Teardown     Close Browser

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${LOGIN PAGE}    http://localhost:4680/tbuis/login
${OVERVIEW PAGE} http://localhost:4680/tbuis/teacher-view/overview
${TEACHERS PAGE} http://localhost:4680/tbuis/teacher-view/listOfAllTeachers
${BROWSER}        chrome
${DELAY}          2s

*** Keywords ***
Open Browser To Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}

*** Test Cases ***
Teacher List
    Go To Login Page
    Login As Teacher
    Go To Teacher List
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[2]    Julia Easyrider
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[2]    Olivia Keen
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[2]    John Lazy
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[2]    Thomas Scatterbrained
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[2]    Peter Strict
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance

*** Keywords ***
Go To Login Page
    Click Link    xpath=//*[@id="header.link.login"]
    Location Should Be    ${LOGIN PAGE}
    Sleep    ${DELAY}

Login As Teacher
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Location Should Be    ${OVERVIEW PAGE}
    Sleep    ${DELAY}

Go To Teacher List
    Click Link    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Location Should Be    ${TEACHERS PAGE}
    Sleep    ${DELAY}