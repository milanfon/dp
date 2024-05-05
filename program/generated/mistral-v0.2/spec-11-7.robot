 ```ruby
*** Settings ***
Library         SeleniumLibrary
SeleniumOptions  {browser="chrome", profile_directory="Path/To/Your/Chrome/Profile"}

*** Variables ***
${DELAY}        3s

*** Test Case ***
Example Test
    [Documentation]         Example test

    [Setup]                 Set Up
    Set Variable         ${URL}    http://localhost:4680/tbuis/index.jsp

    [Teardown]            Teardown
    Close Browser

    [Test]                Test
    Set Viewport         1501   1104
    Go To                ${URL}

    ${wait}               Wait Until Page Contains   University information system

    [Steps]               Step 1 - Login
    Click Element          id=header.link.login
    Input Text            id=loginPage.userNameInput          pedant
    Click Element          id=loginPage.passwordInput
    Input Text            id=loginPage.passwordInput          pass
    Click Element          id=loginPage.loginFormSubmit
    ${wait}               Wait Until Page Contains

    [Steps]               Step 2 - Check Students
    Click Element          id=tea.menu.mySubjects
    ${wait}               Wait Until Page Contains   Teacher's View

    [Steps]               Step 2.1 - Check Students (4)
    Click Element          id=tea.mySubjects.table.listOfStudentsButton-1
    ${wait}               Wait Until Element Is Visible   id=closeModalButtonCross
    Click Element          id=closeModalButtonCross

    Click Element          id=tea.mySubjects.table.listOfStudentsButton-2
    ${wait}               Wait Until Page Contains   No students

    [Teardown]            Teardown
    Close Browser

    [Documentation]         Waits ${DELAY} between each step
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

    [Teardown]            Teardown
    ${wait}               Wait ${DELAY}

   