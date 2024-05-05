*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***

*** Test Cases ***

Scenario1
    [Documentation]    Test case for teacher scenario

    *** Settings ***
    Tag            teacher

    *** Set Up ***
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Set Browser Implicit Wait    10

    *** Teardown ***
    Close Browser

    *** Steps ***
    Navigate    http://localhost:4680/tbuis/index.jsp
    Click    main
        [Find Ids]    #header.link.login
    Click    main
        [Find Ids]    #loginPage.userNameInput
    Input Text    main    pedant
    Click    main
        [Find Ids]    #loginPage.passwordInput
    Input Text    main    pass
    Click    main
        [Find Ids]    #loginPage.loginFormSubmit
    Click    main
        [Find Ids]    #tea.menu.otherSubjects
    Click    main
        [Find Ids]    #tea.otherSubjects.table.participateButton-3
    Sleep    3s
    ElementShouldBeVisible    main
        [Find XPaths]    //*[@id="tea.otherSubjects.successAlert"]
    ElementShouldContain    main
        [Find XPaths]    //*[@id="tea.otherSubjects.table.otherSubjectsRow-2"]/td[2]    Linear Algebra
    ElementShouldContain    main
        [Find XPaths]    //*[@id="tea.otherSubjects.table.otherSubjectsRow-2"]/td[3]    Alice Pedant

    *** Teardown ***

Scenario2
    [Documentation]    Test case for student scenario

    *** Settings ***
    Tag            student

    *** Set Up ***
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Set Browser Implicit Wait    10

    *** Teardown ***
    Close Browser

    *** Steps ***
    Navigate    http://localhost:4680/tbuis/index.jsp
    Click    main
        [Find Ids]    #header.link.login
    Click    main
        [Find Ids]    #loginPage.userNameInput
    Input Text    main    student
    Click    main
        [Find Ids]    #loginPage.passwordInput
    Input Text    main    studentPass
    Click    main
        [Find Ids]    #loginPage.loginFormSubmit
    Click    main
        [Find Ids]    #stu.menu.otherSubjects
    Sleep    3s
    ElementShouldBeVisible    main
        [Find XPaths]    //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    ElementShouldContain    main
        [Find XPaths]    //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant