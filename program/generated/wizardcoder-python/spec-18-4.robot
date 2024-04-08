## Scenario: Check teachers' courses

    ${DELAY}    ${5}
    ${BROWSER}    Open Browser    http://localhost:4680/tbuis/    Chrome
    Set Selenium Implicit Wait    ${DELAY}
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    ${teachers}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table"]
    Should Contain    ${teachers}    Julia Easyrider
    Should Contain    ${teachers}    Olivia Keen
    Should Contain    ${teachers}    John Lazy
    Should Contain    ${teachers}    Alice Pedant
    Should Contain    ${teachers}    Thomas Scatterbrained
    Should Contain    ${teachers}    Peter Strict
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    Should Contain    ${text}    Numerical Methods
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    Should Contain    ${text}    Database Systems
    Should Contain    ${text}    Fundamentals of Computer Networks
    Should Contain    ${text}    Introduction to Algorithms
    Should Contain    ${text}    Mobile Applications
    Should Contain    ${text}    Web Programming
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Should Be Empty    ${text}
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Should Contain    ${text}    Computer System Engineering
    Should Contain    ${text}    Database Systems
    Should Contain    ${text}    Operating Systems
    Should Contain    ${text}    Programming Techniques
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    Should Contain    ${text}    Computation Structures
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    Should Contain    ${text}    Operating Systems
    Should Contain    ${text}    Programming in Java
    Should Contain    ${text}    Software Engineering
    Should Contain    ${text}    Software Quality Assurance
    Close Browser


    ${DELAY}    ${5}
    ${BROWSER}    Open Browser    http://localhost:4680/tbuis/    Chrome
    Set Selenium Implicit Wait    ${DELAY}
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    ${teachers}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table"]
    Should Contain    ${teachers}    Julia Easyrider
    Should Contain    ${teachers}    Olivia Keen
    Should Contain    ${teachers}    John Lazy
    Should Contain    ${teachers}    Alice Pedant
    Should Contain    ${teachers}    Thomas Scatterbrained
    Should Contain    ${teachers}    Peter Strict
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    Should Contain    ${text}    Numerical Methods
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    Should Contain    ${text}    Database Systems
    Should Contain    ${text}    Fundamentals of Computer Networks
    Should Contain    ${text}    Introduction to Algorithms
    Should Contain    ${text}    Mobile Applications
    Should Contain    ${text}    Web Programming
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Should Be Empty    ${text}
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Should Contain    ${text}    Computer System Engineering
    Should Contain    ${text}    Database Systems
    Should Contain    ${text}    Operating Systems
    Should Contain    ${text}    Programming Techniques
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    Should Contain    ${text}    Computation Structures
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    Should Contain    ${text}    Operating Systems
    Should Contain    ${text}    Programming in Java
    Should Contain    ${text}    Software Engineering
    Should Contain    ${text}    Software Quality Assurance
    Close Browser 