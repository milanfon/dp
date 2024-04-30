*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Check Elements After Opening Page
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Selenium Speed    0.5

    # Perform steps from JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]

    # Check if element with id "stu.myExamDates.participantsModal.title" has appeared
    Wait Until Page Contains Element    xpath://*[@id="stu.myExamDates.participantsModal.title"]    10

    # Check if there are <td> elements with values are present: "Benjamin Green", "Mia Orange", "Charlotte Purple" and "Isabella Yellow"
    ${element_texts}=    Get Elements    xpath://td
    Should Be In    @{element_texts}    Benjamin Green
    Should Be In    @{element_texts}    Mia Orange
    Should Be In    @{element_texts}    Charlotte Purple
    Should Be In    @{element_texts}    Isabella Yellow

    Close Browser
