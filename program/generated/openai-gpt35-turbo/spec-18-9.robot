*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}          1s

*** Test Cases ***
Check Teacher Information
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Wait Until Page Contains    University information system    timeout=10s

    Click Element    xpath///*[@id="header.link.login"]
    Wait Until Page Contains    Login    timeout=10s

    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    lazy
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    Teacher's View    timeout=10s

    Click Element    xpath///*[@id="tea.menu.listOfAllTeachers"]
    Wait Until Page Contains    Teacher's View    timeout=10s

    Wait ${DELAY}

    Page Should Contain    Julia Easyrider
    Page Should Contain    Olivia Keen
    Page Should Contain    John Lazy
    Page Should Contain    Alice Pedant
    Page Should Contain    Thomas Scatterbrained
    Page Should Contain    Peter Strict

    Wait ${DELAY}

    Element Text Should Be    xpath///*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Text Should Be    xpath///*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Element Text Should Not Be    xpath///*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    
    Element Text Should Be    xpath///*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Element Text Should Be    xpath///*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Element Text Should Be    xpath///*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance

    Close Browser