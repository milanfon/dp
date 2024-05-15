*** Settings ***
Library             SeleniumLibrary
Browser              Chrome

*** Variables ***
${URL}              http://localhost:4680/tbuis/index.jsp

*** Test Case ***
Test Case My Test Case
    [Documentation]        Test case for JSON recording

    Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Go To                   ${URL}

    ${title}               Get Title
    Run Keyword If         ${title}               Equals      University information system
        [Documentation]        Navigation to University information system page is successful
    Else
        [Documentation]        Navigation to University information system page is not successful
        Log                  Navigation to University information system page is not successful
        Exit Test Case

    Click Element           main
                           xpath=//*[@id="header.link.login"]

    Input Text             main                  xpath=//*[@id="loginPage.userNameInput"]                  orange

    Click Element           main
                           xpath=//*[@id="loginPage.passwordInput"]

    Input Text             main                  xpath=//*[@id="loginPage.passwordInput"]                  pass

    Click Element           main
                           xpath=//*[@id="loginPage.loginFormSubmit"]

    [Documentation]        Wait for "My Exam Dates" button to appear
    Sleep                 5

    Wait Until Element Is Visible
        [Documentation]        Wait for "My Exam Dates" button to appear
        Element Is Visible    main                  xpath=//*[@id="stu.menu.myExamDates"]

    Click Element           main
                           xpath=//*[@id="stu.menu.myExamDates"]

    [Documentation]        Wait for "Participants" button to appear and be clickable
    Sleep                 5

    Wait Until Element Is Clickable
        [Documentation]        Wait for "Participants" button to appear and be clickable
        Element Is Clickable  main                  xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]

    Click Element           main
                           xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]

    [Documentation]        Check if "stu.myExamDates.participantsModal.title" element is present
    Element Should Contain  main                id=stu.myExamDates.participantsModal.title         Anything

    [Documentation]        Check if there are <td> elements with the specified values
    Element Should Contain  //td                text=Benjamin Green
    Element Should Contain  //td                text=Mia Orange
    Element Should Contain  //td                text=Charlotte Purple
    Element Should Contain  //td                text=Isabella Yellow

    Go To                  ${URL}
    Go To                  ${URL}

    # Add delay between scenarios if needed

    # Close browser
    Close Browser