*** Settings ***
Library            SeleniumLibrary
Browser            Chrome

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Test My Exam Dates
    [Documentation]        Test case to check My Exam Dates page

    [Preparation]         Set Viewport
        *** Set Viewport ***
        width            1501
        height           1104
        deviceScaleFactor 1
        isMobile          False
        hasTouch          False
        isLandscape       False

    [Actions]         Open URL
        Open Browser            ${url}

    [Actions]         Login
        Click Element            id=header.link.login
        Input Text            id=loginPage.userNameInput         orange
        Click Element            id=loginPage.passwordInput
        Input Text            id=loginPage.passwordInput         pass
        Click Element            id=loginPage.loginFormSubmit

    [Actions]         Click My Exam Dates
        Click Element            id=stu.menu.myExamDates

    [Actions]         Check Modal Title
        Title Should Be            My Exam Dates

    [Actions]         Check Participants
        ${participants}            xpath//table[@id='stu.myExamDates.participantsTable']//td[contains(.,%{participants_values}%)]
        ${num_participants}        length            ${participants}
        ${participants_values}    "Benjamin Green, Mia Orange, Charlotte Purple, Isabella Yellow"

        *** Test ***
        ${num_participants}        Should Be           4

    [Teardown]         Close Browser

*** Keywords ***