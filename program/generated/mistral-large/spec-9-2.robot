*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  chrome
${URL}  http://localhost:4680/tbuis/index.jsp
${DELAY}  1s

*** Test Cases ***
Check Participants
    Open Browser  ${URL}  ${BROWSER}
    Set Window Size  1501  1104
    Maximize Browser Window

    # Login steps
    Click Element  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]

    # Navigate to My Exam Dates and open participants modal
    Click Element  xpath://*[@id="stu.menu.myExamDates"]
    Click Element  xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]

    # Check if element with id "stu.myExamDates.participantsModal.title" has appeared
    Wait Until Page Contains Element  xpath://*[@id="stu.myExamDates.participantsModal.title"]  ${DELAY}
    Element Should Be Visible  xpath://*[@id="stu.myExamDates.participantsModal.title"]

    # Check if there are <td> elements with values are present: "Benjamin Green", "Mia Orange", "Charlotte Purple" and "Isabella Yellow"
    ${participants}  Create List  Benjamin Green  Mia Orange  Charlotte Purple  Isabella Yellow
    FOR  ${participant}  IN  @{participants}
        Page Should Contain Element  xpath://td[text()='${participant}']
    END

    Close Browser
