*** Settings ***
Library    SeleniumLibrary
Library    SeleniumLibrary    timeout=10
Library    SeleniumLibrary    browser=chrome
Library    SeleniumLibrary    executable_path=/usr/local/bin/chromedriver

*** Test Cases ***
Open Page And Check Teachers And Courses
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2
    Page Should Contain    Julia Easyrider
    Page Should Contain    Olivia Keen
    Page Should Contain    John Lazy
    Page Should Contain    Alice Pedant
    Page Should Contain    Thomas Scatterbrained
    Page Should Contain    Peter Strict
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Element Should Not Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    *
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Close Browser