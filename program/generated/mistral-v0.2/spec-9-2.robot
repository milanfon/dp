*** Settings ***
Library           SeleniumLibrary
Browser           Chrome

*** Test Case ***
Open Page
    [Document]        ${json}
    Set Up
        Set Global Variables
            ${title=${json["title"]}}

    [Document]        ${json}
    [Actions]
        Open Browser    ${title}
        Set Viewport
            ${width=1501}
            ${height=1104}
            ${device_scale_factor=1}

    [Document]        ${json}
    [Actions]
        Navigate To    ${json["steps"][0]["url"]}
        Title Should Be ${json["steps"][0]["assertedEvents"][0]["title"]}

    [Document]        ${json}
    [Actions]
        Click Element
            ${locator=xpath=//*[@id="header.link.login"]}
            TagName        main

    [Document]        ${json}
    [Actions]
        Input Text    //*[@id="loginPage.userNameInput"]    ${json["steps"][3]["value"]}
        Click Element
            ${locator=xpath=//*[@id="loginPage.passwordInput"]}
            TagName        main

    [Document]        ${json}
    [Actions]
        Input Text    //*[@id="loginPage.passwordInput"]    ${json["steps"][4]["value"]}
        Click Element
            ${locator=xpath=//*[@id="loginPage.loginFormSubmit"]}
            TagName        main

    [Document]        ${json}
    [Actions]
        Click Element
            ${locator=xpath=//*[@id="stu.menu.myExamDates"]}
            TagName        main

    [Document]        ${json}
    [Actions]
        Click Element
            ${locator=xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]}
            TagName        main

    [Document]        ${json}
    [Actions]
        Wait Until Element Is Visible
            ${locator=xpath=//*[@id="stu.myExamDates.participantsModal.title"]}
            Element Should Be Visible

    [Document]        ${json}
    [Actions]
        Element Should Contain
            ${locator=xpath=//*[contains(@text(), "Benjamin Green")]}
            Text            Benjamin Green

    [Document]        ${json}
    [Actions]
        Element Should Contain
            ${locator=xpath=//*[contains(@text(), "Mia Orange")]}
            Text            Mia Orange

    [Document]        ${json}
    [Actions]
        Element Should Contain
            ${locator=xpath=//*[contains(@text(), "Charlotte Purple")]}
            Text            Charlotte Purple

    [Document]        ${json}
    [Actions]
        Element Should Contain
            ${locator=xpath=//*[contains(@text(), "Isabella Yellow")]}
            Text            Isabella Yellow

    [Document]        ${json}
    [Actions]
        Close Browser