*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Scenario
    Open browser    chrome
    Set Viewport    1501    1104
    Navigate To     ${URL}
    Click Element    xpath://*[contains(@id, "header.link.login")]
    Input Text      xpath://*[contains(@id, "loginPage.userNameInput")]    lazy
    Input Text      xpath://*[contains(@id, "loginPage.passwordInput")]    pass
    Click Element    xpath://*[contains(@id, "loginPage.loginFormSubmit")]
    Click Element    xpath://*[contains(@id, "tea.menu.listOfAllTeachers")]
    Delay    2s
    Page Should Contain Element    xpath://*[contains(text(), "Julia Easyrider")]
    Page Should Contain Element    xpath://*[contains(text(), "Olivia Keen")]
    Page Should Contain Element    xpath://*[contains(text(), "John Lazy")]
    Page Should Contain Element    xpath://*[contains(text(), "Alice Pedant")]
    Page Should Contain Element    xpath://*[contains(text(), "Thomas Scatterbrained")]
    Page Should Contain Element    xpath://*[contains(text(), "Peter Strict")]
    Page Should Contain Element    xpath:////*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Page Should Contain Element    xpath:////*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Page Should Not Contain Element    xpath:////*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Page Should Contain Element    xpath:////*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Page Should Contain Element    xpath:////*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Page Should Contain Element    xpath:////*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Close Browser