*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${DELAY}          2s
${EXECUTION_SPEED}    0.5
${URL}            http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Open Browser To Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${EXECUTION_SPEED}

Login As Teacher
    Click Link    xpath=//*[@id="header.link.login"]
    Wait Until Element Is Visible    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Submit Form    xpath=//*[@id="loginPage.loginForm"]
    Wait Until Element Is Visible    xpath=//*[@id="tea.menu.listOfAllTeachers"]

Open List Of All Teachers
    Click Link    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Wait Until Element Is Visible    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[2]

*** Test Cases ***
Check List Of All Teachers
    Open Browser To Page
    Login As Teacher
    Open List Of All Teachers
    Wait Until Page Contains    Julia Easyrider
    Wait Until Page Contains    Olivia Keen
    Wait Until Page Contains    John Lazy
    Wait Until Page Contains    Alice Pedant
    Wait Until Page Contains    Thomas Scatterbrained
    Wait Until Page Contains    Peter Strict
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Sleep    ${DELAY}
    Close Browser