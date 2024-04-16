*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Check Teacher Information
    Open Browser    ${URL}    chrome
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false
    Click Element    aria/Login
    Click Element    aria/Username
    Input Text    aria/Username    lazy
    Click Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Click Element    aria/List of All Teachers
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Page Should Not Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Close Browser