*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***

*** Test Cases ***

Test Check Students
    [Documentation]        Check if the page contains the specified students names and the "No students" text

    [Preparation]
    Set Viewport 1501, 1104, 1
    Set Browser Implicit Wait 10

    [Actions]
    Open Browser "http://localhost:4680/tbuis/index.jsp"

    [Step]
    Click Element xpath///*[@id="header.link.login"]

    [Step]
    Input Text Text=pedant Element=id:loginPage.userNameInput
    Input Text Text=pass Element=id:loginPage.passwordInput
    Click Element xpath///*[@id="loginPage.loginFormSubmit"]

    [Step]
    Click Element xpath///*[@id="tea.menu.mySubjects"]

    [Step]
    Click Element xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-0"]

    [Step]
    Click Element xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
    Sleep 1s

    [Step]
    Click Element xpath///*[@id="closeModalButtonCross"]

    [Step]
    Click Element xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-2"]

    [Step]
    Element Should Exist Element=xpath///*[.="No students"]

    [Step]
    Should Contain Element xpath///*[@id="main"] Text="Benjamin Green"
    Should Contain Element xpath///*[@id="main"] Text="Mia Orange"
    Should Contain Element xpath///*[@id="main"] Text="Charlotte Purple"
    Should Contain Element xpath///*[@id="main"] Text="Isabella Yellow"

    [Teardown]
    Close Browser