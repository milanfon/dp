*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Check Participants
    Open Browser    ${URL}    ${BROWSER}
    Set Viewport Size    1501    1104

    # Login steps
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Navigate to My Exam Dates page
    Click Element    xpath://*[@id="stu.menu.myExamDates"]

    # Open participants modal
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]

    # Check if the modal has appeared
    Wait Until Page Contains Element    xpath://*[@id="stu.myExamDates.participantsModal.title"]    10s
    Element Should Be Visible    xpath://*[@id="stu.myExamDates.participantsModal.title"]

    # Check if the participants are present
    ${participants}    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    :FOR    ${participant}    IN    @{participants}
    \    Element Text Should Be    xpath://td[contains(text(), '${participant}')]    ${participant}

    Close Browser