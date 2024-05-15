*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser To Page
Test Teardown     Close Browser

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Open Browser To Page
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    2s

*** Test Cases ***
Check all teachers list
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Page Should Contain    Julia Easyrider
    Sleep    2s
    Page Should Contain    Olivia Keen
    Sleep    2s
    Page Should Contain    John Lazy
    Sleep    2s
    Page Should Contain    Alice Pedant
    Sleep    2s
    Page Should Contain    Thomas Scatterbrained
    Sleep    2s
    Page Should Contain    Peter Strict
    Sleep    2s
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Sleep    2s
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Sleep    2s
    Element Should Not Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Sleep    2s
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Sleep    2s
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Sleep    2s
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance