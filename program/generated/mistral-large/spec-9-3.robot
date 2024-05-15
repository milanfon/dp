*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Check Participants
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104

    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]

    ${title_visible}=    Run Keyword And Return Status    Page Should Contain Element    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Should Be True    ${title_visible}

    ${Benjamin_Green_visible}=    Run Keyword And Return Status    Page Should Contain Element    xpath://td[contains(text(), "Benjamin Green")]
    Should Be True    ${Benjamin_Green_visible}

    ${Mia_Orange_visible}=    Run Keyword And Return Status    Page Should Contain Element    xpath://td[contains(text(), "Mia Orange")]
    Should Be True    ${Mia_Orange_visible}

    ${Charlotte_Purple_visible}=    Run Keyword And Return Status    Page Should Contain Element    xpath://td[contains(text(), "Charlotte Purple")]
    Should Be True    ${Charlotte_Purple_visible}

    ${Isabella_Yellow_visible}=    Run Keyword And Return Status    Page Should Contain Element    xpath://td[contains(text(), "Isabella Yellow")]
    Should Be True    ${Isabella_Yellow_visible}

    Close Browser
