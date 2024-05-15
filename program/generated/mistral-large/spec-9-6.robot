*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    1s
${URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Test Case
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104

    # Login steps
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Navigate to My Exam Dates page
    Click Element    xpath://*[@id="stu.menu.myExamDates"]

    # Open Participants modal
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]

    # Check if element with id "stu.myExamDates.participantsModal.title" has appeared
    Wait Until Page Contains Element    id=stu.myExamDates.participantsModal.title    ${DELAY}
    Element Should Be Visible    id=stu.myExamDates.participantsModal.title

    # Check if there are <td> elements with values are present: "Benjamin Green", "Mia Orange", "Charlotte Purple" and "Isabella Yellow"
    ${names}=    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    :FOR    ${name}    IN    @{names}
    \    Wait Until Page Contains Element    xpath://td[contains(., '${name}')]    ${DELAY}
    \    Page Should Contain Element    xpath://td[contains(., '${name}')]

    Close Browser
