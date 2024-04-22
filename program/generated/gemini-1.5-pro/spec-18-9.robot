*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser    ${EMPTY}    ${BROWSER}
Test Teardown    Close Browser
Suite Teardown    Close All Browsers

*** Variables ***
${BROWSER}    chrome
${EMPTY}    ${SPACE}

*** Keywords ***
Open Page And Check Content
    [Arguments]    ${url}
    Go To    ${url}
    Sleep    1s
    Page Should Contain    Julia Easyrider
    Page Should Contain    Olivia Keen
    Page Should Contain    John Lazy
    Page Should Contain    Alice Pedant
    Page Should Contain    Thomas Scatterbrained
    Page Should Contain    Peter Strict
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    ${EMPTY}
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance

*** Test Cases ***
Open Page And Check Content
    Open Page And Check Content    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    1s