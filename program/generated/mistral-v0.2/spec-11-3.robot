*** Settings ***
Library      SeleniumLibrary
Browser      Chrome

*** Variables ***
URL = http://localhost:4680/tbuis/index.jsp

*** Test Case ***
Set Viewport
    width = 1501
    height = 1104
    deviceScaleFactor = 1
    isMobile = False
    hasTouch = False
    isLandscape = False

Navigate To
    [URL]
    [Set Speed 2]

    Click Button
        [Find XPath] //*[@id="header.link.login"]
        [Name] closeModalButtonCross
        [Offset X] 27.5
        [Offset Y] 25

    Click Button
        [Find XPath] //*[@id="tea.mySubjects.table.listOfStudentsButton-2"]

    [Title] Should contain No students
    [Text] Should contain No students

    *** Teardown ***
    Close Browser

*** Test Case ***
[Before All]
    Set Viewport
        width = 1501
        height = 1104
        deviceScaleFactor = 1
        isMobile = False
        hasTouch = False
        isLandscape = False

[Setup]
    Navigate To
        [URL]
        [Set Speed 2]

    Click Button
        [Find XPath] //*[@id="header.link.login"]
        [Name] Login

    Input Text
        [Find XPath] //*[@id="loginPage.userNameInput"]
        [Name] username
        [Value] pedant

    Input Text
        [Find XPath] //*[@id="loginPage.passwordInput"]
        [Name] password
        [Value] pass

    Click Button
        [Find XPath] //*[@id="loginPage.loginFormSubmit"]

    Click Button
        [Find XPath] //*[@id="tea.menu.mySubjects"]
        [Name] My Subjects

    Click Button
        [Find XPath] //*[@id="tea.mySubjects.table.listOfStudentsButton-0"]

    [Title] Should contain Teacher's View

    Click Button
        [Find XPath] //*[@id="tea.mySubjects.table.listOfStudentsButton-2"]

    [Title] Should contain No students

    [Teardown]
    Click Button
        [Find XPath] //*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
        [Name] Students (1)

    Click Button
        [Find XPath] //*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
        [Name] Students (3)

    Click Button
        [Find XPath] //*[@id="tea.mySubjects.table.listOfStudentsButton-4"]
        [Name] Students (4)

    Click Button
        [Find XPath] //*[@id="tea.mySubjects.table.listOfStudentsButton-5"]
        [Name] Students (5)

    Click Button
        [Find XPath] //*[@id="tea.mySubjects.table.listOfStudentsButton-6"]
        [Name] Students (6)

    Click Button
        [Find XPath] //*[@id="tea.mySubjects.table.listOfStudentsButton-7"]
        [Name] Students (7)

    Click Button
        [Find Xpath] //*[@id="closeModalButtonCross"]

    Close Browser