*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Test Cases ***

Scenario1
    [Documentation]         Open page for student and check elements
    [Documentation]         Open page for teacher and check elements

    [Preparation]         Open browser

    [Steps]         Set Viewport                width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    [Steps]         Go To                       url=http://localhost:4680/tbuis/index.jsp

    [Steps]         Login                       username=    password=
    [Steps]         Go To                       url=http://localhost:4680/tbuis/student-view/otherSubjects
    [Steps]         Click Element                 locator=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    [Steps]         Wait Until Element Is Visible    locator=//*[@id="stu.otherSubjects.successAlert"]

    [Steps]         Go To                       url=http://localhost:4680/tbuis/student-view/mySubjects
    [Steps]         Wait Until Element Contains    locator=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]    text=Software Quality Assurance
    [Steps]         Wait Until Element Contains    locator=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]    text=Peter Strict

    [Steps]         [Documentation]         Logout
    [Steps]         Logout

    [Teardown]         Close Browser

Scenario2
    [Documentation]         Open page for teacher and check elements

    [Preparation]         Open browser

    [Steps]         Set Viewport                width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    [Steps]         Go To                       url=http://localhost:4680/tbuis/index.jsp

    [Steps]         Login                       username=strict    password=pass
    [Steps]         Go To                       url=http://localhost:4680/tbuis/teacher-view/mySubjects
    [Steps]         Wait Until Element Contains    locator=//td[text()="Students (2) "]    parent=//button[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    [Steps]         Click Element                 locator=//button[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    [Steps]         Wait Until Element Is Visible    locator=//td[text()="William Maroon"]

    [Teardown]         [Documentation]         Logout
    [Teardown]         Close Browser

*** Keywords ***

Login
    [Documentation]         Login to the application
    [Arguments]         username
    [Arguments]         password
    [Return]         None

    [Steps]         Click Element                 locator=//*[@aria-label="Login"]
    [Steps]         Input Text                    locator=//*[@aria-label="Username"]    text=${username}
    [Steps]         Input Text                    locator=//*[@aria-label="Password"]    text=${password}
    [Steps]         Click Element                 locator=//*[@aria-label="Login"]