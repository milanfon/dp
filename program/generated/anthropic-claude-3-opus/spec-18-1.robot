Here is the Robot Framework scenario:

*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Check Teacher List
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath:///*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath:///*[@id="loginPage.userNameInput"]
    Click Element    xpath:///*[@id="loginPage.userNameInput"]
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    lazy
    Click Element    xpath:///*[@id="loginPage.passwordInput"]
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath:///*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath:///*[@id="tea.menu.listOfAllTeachers"]
    Click Element    xpath:///*[@id="tea.menu.listOfAllTeachers"]
    Wait Until Page Contains    List of All Teachers
    Page Should Contain    Julia Easyrider
    Page Should Contain    Olivia Keen  
    Page Should Contain    John Lazy
    Page Should Contain    Alice Pedant
    Page Should Contain    Thomas Scatterbrained
    Page Should Contain    Peter Strict
    Element Text Should Be    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Should Contain    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems
    Element Should Contain    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Fundamentals of Computer Networks
    Element Should Contain    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Introduction to Algorithms
    Element Should Contain    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Mobile Applications
    Element Should Contain    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Web Programming
    Element Text Should Be    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    ${EMPTY}
    Element Should Contain    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering
    Element Should Contain    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Database Systems
    Element Should Contain    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Operating Systems
    Element Should Contain    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Programming Techniques
    Element Text Should Be    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Element Should Contain    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems
    Element Should Contain    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Programming in Java
    Element Should Contain    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Software Engineering
    Element Should Contain    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Software Quality Assurance
    Sleep    2s
    Close Browser