*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Check Elements After Opening Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Steps from JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]

    # Check if element with id "stu.myExamDates.participantsModal.title" has appeared
    Wait Until Page Contains Element    id=stu.myExamDates.participantsModal.title    timeout=10s
    Run Keyword And Ignore Error    Page Should Contain Element    id=stu.myExamDates.participantsModal.title

    # Check if there are <td> elements with values are present: "Benjamin Green", "Mia Orange", "Charlotte Purple" and "Isabella Yellow"
    ${names}=    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    FOR    ${name}    IN    @{names}
        Wait Until Page Contains Element    xpath://td[contains(text(),"${name}")]    timeout=10s
        Run Keyword And Ignore Error    Page Should Contain Element    xpath://td[contains(text(),"${name}")]
    END

    Close Browser
