 ```python
*** Settings ***
Library          SeleniumLibrary
Browser          Chrome

*** Variables ***
URL              http://localhost:4680/tbuis/

*** Test Cases ***

Test Case        student
    [Documentation]        Test student functionality

    [Preparation]
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Set Browser Implicit Wait    10s

    [Steps]
    Navigate To     ${URL}
    Click Element    id=header.link.login
    Input Text      id=loginPage.userNameInput    ${username}
    Input Text      id=loginPage.passwordInput    ${password}
    Click Element    id=loginPage.loginFormSubmit
    Click Element    id=stu.menu.otherExamDates
    Click Element    id=stu.otherExamDates.table.registerButton-2-0
    Wait Until Element Is Visible    id=stu.otherExamDates.successAlert    10s
    Click Element    id=stu.menu.myExamDates

    [Teardown]
    Close Browser

Test Case        teacher
    [Documentation]        Test teacher functionality

    [Preparation]
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Set Browser Implicit Wait    10s

    [Steps]
    Navigate To     ${URL}
    Click Element    id=header.link.login
    Input Text      id=loginPage.userNameInput    ${teacher_username}
    Input Text      id=loginPage.passwordInput    ${teacher_password}
    Click Element    id=loginPage.loginFormSubmit
    Click Element    id=tea.menu.myExamDates
    Click Element    id=tea.menu.myExamDates
    Click Element    id=tea.myExamDates.table.participantsButton-1-0

    [Teardown]
    Click Element    id=tea.menu.myExamDates
    Click Element    id=tea.menu.home
    Close Browser

*** Keywords ***

Function        Wait Until Element Is Visible
    [Documentation]        Wait until an element is visible
    [Arguments]    id
    [Returns]    status

    [Script]
    ${status} = ${Get Element Status}[
        Target=Element[Find Element Id=${id}]
        Wait=10s
        ]

Function        Get Element Status
    [Documentation]        Get status of an element
    [Arguments]    Target
    [Returns]    status

    [Script]
    ${status} = ${Element Is Element Visible}[${Target}]

Function        Input Text
    [Documentation]        Input text into an element
    [Arguments]    locator    text
    [Returns]    status

    [Script]
    ${status} = ${Keyboard Key Down}[${To Key}--->Key.Enter]
    ${status} = ${Keyboard Key Down}[${To Key}--->Key.BACK_SPACE]
    ${status} = ${Keyboard Key Down}[${To Key}--->Key.BACK_SPACE]
    ${status} = ${Keyboard Key Down}[${To Key}--->Key.BACK_SPACE]
    ${status} = ${Keyboard Key Down}[${To Key}--->Key.BACK_SPACE]
    ${status} = ${Keyboard Key Down}[${To Key}--->Key.BACK_SPACE]
    ${status} = ${Keyboard Key Down}[${To Key}--->Key.BACK_SPACE]
    ${status} = ${Keyboard Key Down}[${To Key}--->Key.BACK_SPACE]
    ${status} = ${Keyboard Key Down}[${To Key}--->Key.BACK_SPACE]
    ${status} = ${Keyboard Key Down}[${To Key}--->Key.BACK_SPACE]
    ${status} = ${Keyboard Key Down}[${To Key}--->Key.BACK_SPACE]
    ${status} = ${Keyboard Key Down}[${To Key}--->${TextToInput}]
    ${status} = ${Keyboard Key Down}[${To Key}--->Key.ENTER]

Function        Click Element
    [Documentation]        Click an element
    [Arguments]    locator
    [Returns]    status

    [Script]
    ${status} = ${Element Should Be Clickable}[${1}]
    ${status} = ${Element Click}[${1}]

Function        Set Viewport
    [Documentation]        Set the viewport size
    [Arguments]    width    height    deviceScaleFactor    isMobile    hasTouch    isLandscape

    [Script]
    ${options} = {
        "width": ${width},
        "height": ${height},
        "deviceScaleFactor": ${deviceScaleFactor},
        "isMobile": ${isMobile},
        "hasTouch": ${hasTouch},
        "isLandscape": ${isLandscape}
    }
    ${status} = ${Run Keyword If}[
        ${Is Test Case Running}    ${False}
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=Options
            Value=${options}
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=BrowserOptions
            Value=${options}
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=Viewport
            Value=${options}
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportSize
            Value=${options}
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportSizeString
            Value=${EncodeString}[${Dictionary Get}[${Viewport} width] ${"x"} ${Dictionary Get}[${Viewport} height] ${"x"}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportString
            Value=${EncodeString}[${Dictionary Get}[${Viewport} width] ${"x"} ${Dictionary Get}[${Viewport} height] ${"x"} ${Dictionary Get}[${Viewport} deviceScaleFactor] ${"x"}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportStringJson
            Value=${JsonEncode}[${ViewportString}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJson
            Value=${JsonEncode}[${Viewport}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonString
            Value=${EncodeString}[${ViewportJson}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringJson
            Value=${JsonEncode}[${ViewportJsonString}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringJsonBase64
            Value=${ToBase64}[${ViewportJsonStringJson}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringBase64
            Value=${ToBase64}[${ViewportStringJson}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringBase64Json
            Value=${JsonEncode}[${ViewportJsonStringBase64}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringBase64JsonBase64
            Value=${ToBase64}[${ViewportJsonStringBase64Json}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringBase64JsonBase64String
            Value=${EncodeString}[${ViewportJsonStringBase64JsonBase64}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringBase64JsonBase64StringJson
            Value=${JsonEncode}[${ViewportJsonStringBase64JsonBase64String}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringBase64JsonBase64StringJsonBase64
            Value=${ToBase64}[${ViewportJsonStringBase64JsonBase64StringJsonBase64}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringBase64JsonBase64StringJsonBase64String
            Value=${EncodeString}[${ViewportJsonStringBase64JsonBase64StringJsonBase64}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringBase64JsonBase64StringJsonBase64StringJson
            Value=${JsonEncode}[${ViewportJsonStringBase64JsonBase64StringJsonBase64String}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringBase64JsonBase64StringJsonBase64StringJsonBase64
            Value=${ToBase64}[${ViewportJsonStringBase64JsonBase64StringJsonBase64StringJsonBase64}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringBase64JsonBase64StringJsonBase64StringJsonBase64StringJsonBase64String
            Value=${EncodeString}[${ViewportJsonStringBase64JsonBase64StringJsonBase64StringJsonBase64StringJsonBase64String}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringBase64JsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64String
            Value=${JsonEncode}[${ViewportJsonStringBase64JsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64String}]
        ]
        ${Run Keyword}[
            Keyword=Set Test Case Variable
            Variable=ViewportJsonStringBase64JsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJsonBase64StringJson