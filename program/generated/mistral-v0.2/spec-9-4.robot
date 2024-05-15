*** Settings ***
Library          SeleniumLibrary
Browser          Chrome

*** Test Cases ***

Test My Exam Dates
    [Documentation]        Test case for checking My Exam Dates page elements

    [Setup]                 Set Up

    [Teardown]             Tear Down

    [Steps]                 Set Viewport
        *** Set Viewport ***
        width            1501
        height           1104
        deviceScaleFactor 1
        isMobile          false
        hasTouch          false
        isLandscape       false

    [Steps]                 Navigate to URL
        *** Navigate ***
        URL               http://localhost:4680/tbuis/index.jsp

    [Steps]                 Login
        *** Click Keyboard ***
            Key            TAB
            Key            TAB
            Key            TAB
            Key            TAB

        *** Click Element ***
            Element        //*[@id="header.link.login"]

        *** Click Element ***
            Element        //*[@id="loginPage.userNameInput"]
            Text           orange

        *** Click Element ***
            Element        //*[@id="loginPage.passwordInput"]
            Text           pass

        *** Click Element ***
            Element        //*[@id="loginPage.loginFormSubmit"]

    [Steps]                 Click My Exam Dates
        *** Click Element ***
            Element        //*[@id="stu.menu.myExamDates"]
            Text           My Exam Dates

    [Steps]                 Check My Exam Dates title
        *** Wait ***
            seconds        5

        *** Element Should Exist ***
            Element        //*[@id="stu.myExamDates.participantsModal.title"]

    [Steps]                 Check Participants table rows
        *** Wait ***
            seconds        5

        *** Element Should Contain ***
            Element        //*[@id="stu.myExamDates.participantsTable"]//tr
            Text           1
            Text           Benjamin Green
            Text           Mia Orange
            Text           Charlotte Purple
            Text           Isabella Yellow

    [Teardown]              Close Browser

Test