*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Execute Teacher Steps
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Click Element    main    xpath///*[@id="header.link.login"]
    Input Text    main    xpath///*[@id="loginPage.userNameInput"]    strict
    Input Text    main    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    main    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2 seconds
    Click Element    main    xpath///*[@id="tea.menu.mySubjects"]
    Sleep    2 seconds
    Click Element    main    xpath///*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2 seconds
    Click Element    main    xpath///*[@id="tea.menu.myExamDates"]
    Sleep    2 seconds
    Click Element    main    xpath///*[@id="tea.menu.newExamDates"]
    Sleep    2 seconds
    Click Element    main    xpath///*[@id="tea.menu.setEvaluation"]
    Sleep    2 seconds
    Click Element    main    xpath///*[@id="tea.menu.evaluationTable"]
    Sleep    2 seconds
    Click Element    main    xpath///*[@id="tea.menu.otherSubjects"]
    Sleep    2 seconds
    Click Element    main    xpath///*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2 seconds
    Close Browser

Login as Student and Execute Student Steps
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Click Element    main    xpath///*[@id="header.link.login"]
    Input Text    main    xpath///*[@id="loginPage.userNameInput"]    orange
    Input Text    main    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    main    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2 seconds
    Click Element    main    xpath///*[@id="stu.menu.otherSubjects"]
    Sleep    2 seconds
    Close Browser