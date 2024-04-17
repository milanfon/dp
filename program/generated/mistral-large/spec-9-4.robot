*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Check Participants
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104

    # Login steps
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Navigate to My Exam Dates
    Click Element    xpath://*[@id="stu.menu.myExamDates"]

    # Open Participants Modal
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]

    # Check if element with id "stu.myExamDates.participantsModal.title" has appeared
    Wait Until Element Is Visible    xpath://*[@id="stu.myExamDates.participantsModal.title"]    timeout=10s

    # Check if there are <td> elements with values are present: "Benjamin Green", "Mia Orange", "Charlotte Purple" and "Isabella Yellow"
    ${participants}=    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    FOR    ${participant}    IN    @{participants}
        Page Should Contain Element    xpath://td[text()='${participant}']
    END

    Close Browser
