*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
${URL}          http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Test My Exam Dates
    [Documentation]          Test if elements with specific values appear

    Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Go To                   ${URL}

    ${login_btn}            Element Should Be Visible     xpath=//*[@id="header.link.login"]

    Click Element            ${login_btn}

    ${username_input}       Element Should Be Visible     xpath=//*[@id="loginPage.userNameInput"]
    Input Text            ${username_input}            orange

    ${password_input}       Element Should Be Visible     xpath=//*[@id="loginPage.passwordInput"]
    Input Text            ${password_input}            pass

    ${login_btn_elem}       Element Should Be Visible     xpath=//*[@id="loginPage.loginFormSubmit"]

    Click Element            ${login_btn_elem}

    ${my_exam_dates_btn}    Element Should Be Visible     xpath=//*[@id="stu.menu.myExamDates"]

    Click Element            ${my_exam_dates_btn}

    ${participants_btn}     Element Should Be Visible     xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]

    Click Element            ${participants_btn}

    [Title]                 Should Be Equal            Participants

    ${participants_table}  Element Should Be Visible     xpath=//table[@class='ParticipantsTable']

    ${participants_rows}    Element Should Contain       ${participants_table}                 xpath=//tr[./td[./text()='Benjamin Green']]
    ${participants_rows_2}  Element Should Contain       ${participants_table}                 xpath=//tr[./td[./text()='Mia Orange']]
    ${participants_rows_3}  Element Should Contain       ${participants_table}                 xpath=//tr[./td[./text()='Charlotte Purple']]
    ${participants_rows_4}  Element Should Contain       ${participants_table}                 xpath=//tr[./td[./text()='Isabella Yellow']]

    Log                     INFO                        Elements checked

    Close Browser