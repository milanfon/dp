*** Settings ***
Library           SeleniumLibrary
Documentation     This is a sample test suite.

*** Variables ***
${BROWSER}        chrome
${URL}            http://localhost:4680/tbuis/index.jsp
${DELAY}          2s

*** Keywords ***
Open Browser And Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Link    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Link    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}

*** Test Cases ***
List of All Teachers
    Open Browser And Login
    Page Should Contain    Julia Easyrider
    Sleep    ${DELAY}
    Page Should Contain    Olivia Keen
    Sleep    ${DELAY}
    Page Should Contain    John Lazy
    Sleep    ${DELAY}
    Page Should Contain    Alice Pedant
    Sleep    ${DELAY}
    Page Should Contain    Thomas Scatterbrained
    Sleep    ${DELAY}
    Page Should Contain    Peter Strict
    Sleep    ${DELAY}
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Sleep    ${DELAY}
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Sleep    ${DELAY}
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    *
    Sleep    ${DELAY}
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Sleep    ${DELAY}
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Sleep    ${DELAY}
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Sleep    ${DELAY}
    Close Browser

*** Keywords ***
Close Browser
    Close All Browsers