*** Settings ***
Documentation     Test scenario to validate specific elements and texts on a web page.
Library           SeleniumLibrary

Suite Setup       Open Browser And Setup
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}        Chrome
${URL}            http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Open Browser And Setup
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104

Click Login
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s

Enter Username
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Sleep    1s

Enter Password
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s

Click Login Button
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Navigate To List Of All Teachers
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s

*** Test Cases ***
Open Page And Validate Elements
    [Documentation]    Open page and validate specific elements are present and contain correct texts.
    Click Login
    Enter Username
    Enter Password
    Click Login Button
    Navigate To List Of All Teachers
    Page Should Contain    Julia Easyrider
    Page Should Contain    Olivia Keen
    Page Should Contain    John Lazy
    Page Should Contain    Alice Pedant
    Page Should Contain    Thomas Scatterbrained
    Page Should Contain    Peter Strict
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[4]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[5]    
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[6]    Computer System Engineering, Database Systems, Linear Algebra, Operating Systems, Programming Techniques
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[7]    Computation Structures
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[8]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
