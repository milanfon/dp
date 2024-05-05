*** Settings ***
Library            SeleniumLibrary
Browser            Chrome

*** Test Cases ***

# Scenario 1: Check teacher's My Subjects page

My Subjects Teacher
    [Document]    url: http://localhost:4680/tbuis/teacher-view/mySubjects

    [Before]      Close Browser

    [Setup]       Set Viewport 1501 1104
    Set Viewport 1501 1104 deviceScaleFactor 1
    Set Viewport 1501 1104 isMobile false
    Set Viewport 1501 1104 hasTouch false
    Set Viewport 1501 1104 isLandscape false

    [Step]        Navigate To    http://localhost:4680/tbuis/index.jsp

    [Step]        Click Element    //*[@id="header.link.login"]
    Sleep        1s

    [Step]        Input Text    //*[@id="loginPage.userNameInput"]    strict
    Sleep        1s

    [Step]        Input Text    //*[@id="loginPage.passwordInput"]    pass
    Sleep        1s

    [Step]        Click Element    //*[@id="loginPage.loginFormSubmit"]
    Sleep        1s

    [Step]        Click Element    //*[@id="tea.menu.mySubjects"]
    Sleep        1s

    [Step]        Click Element    //*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep        1s

    [Step]        Click Element    //*[@id="tea.menu.mySubjects"]

    [Step]        Element Should Not Contain Element    //*[@id="tea.mySubjects.table"]    text="Peter Strict"    in_same_row="//*[contains(.,'Operating Systems')]"

# Scenario 2: Check student's Other Subjects page

Other Subjects Student
    [Document]    url: http://localhost:4680/tbuis/student-view/otherSubjects

    [Before]      Close Browser

    [Setup]       Set Viewport 1501 1104
    Set Viewport 1501 1104 deviceScaleFactor 1
    Set Viewport 1501 1104 isMobile false
    Set Viewport 1501 1104 hasTouch false
    Set Viewport 1501 1104 isLandscape false

    [Step]        Navigate To    http://localhost:4680/tbuis/index.jsp

    [Step]        Click Element    //*[@id="header.link.login"]
    Sleep        1s

    [Step]        Input Text    //*[@id="loginPage.userNameInput"]    orange
    Sleep        1s

    [Step]        Input Text    //*[@id="loginPage.passwordInput"]    pass
    Sleep        1s

    [Step]        Click Element    //*[@id="loginPage.loginFormSubmit"]
    Sleep        1s

    [Step]        Click Element    //*[@id="stu.menu.otherSubjects"]
    Sleep        1s

    [Step]        Element Should Not Contain    //*[@id="otherSubjectsTable"]    text="Peter Strict"    in_same_tr="//tr[contains(.,'Operating Systems')]"

[Teardown]       Close Browser