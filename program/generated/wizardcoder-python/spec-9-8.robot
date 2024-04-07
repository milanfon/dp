*** Settings ***
Library    SeleniumLibrary    plugins=SeleniumScreenshot


*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    0.5s
${BROWSER_OPTIONS}    headless=False

*** Test Cases ***
Check Exam Dates
    Open Browser    ${URL}    ${BROWSER}    options=${BROWSER_OPTIONS}
    Set Window Size    1501    104
    Set Viewport Size    1501    104
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Wait Until Element Is Visible    xpath=//*[@id="stu.myExamDates.title"]
    Element Text Should Be    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]    Participants
    Element Text Should Be    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-2"]    Participants
    Element Text Should Be    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-3"]    Participants
    Element Text Should Be    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-4"]    Participants
    Element Should Contain    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]    Benjamin Green
    Element Should Contain    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-2"]    Mia Orange
    Element Should Contain    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-3"]    Charlotte Purple
    Element Should Contain    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-4"]    Isabella Yellow
    Sleep    ${DELAY}
    Close Browser