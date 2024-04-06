*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}         Chrome
${URL}            http://localhost:4680
${DELAY}          0.5s

*** Test Cases ***
Students View
    Open Browser    ${URL}    ${BROWSER}
    # Step 1
    Wait Until Element Is Not Visible    id:header.link.login    ${DELAY}
    # Step 2
    Wait Until Element Is Visible    id:header.title.userHome    ${DELAY}
    Element Text Should Be    id:header.title.userHome    Noah Brown
    # Step 3
    Wait Until Element Is Visible    id:header.link.logout    ${DELAY}
    # Step 4
    Wait Until Element Exists    css:#header.student-view-nav    ${DELAY}
    # Step 5
    Wait Until Element Exists    id:stu.view.title    ${DELAY}
    Element Text Should Be    id:stu.view.title    Student's View
    # Step 6
    Wait Until Element Exists    id:overview.personalInfoForm    ${DELAY}
    # Step 7
    Close All Browsers

Teachers View
    Open Browser    ${URL}    ${BROWSER}
    # Step 1
    Wait Until Element Is Not Visible    id:header.link.login    ${DELAY}
    # Step 2
    Wait Until Element Is Visible    id:header.title.userHome    ${DELAY}
    Element Text Should Be    id:header.title.userHome    John Lazy
    # Step 3
    Wait Until Element Is Visible    id:header.link.logout    ${DELAY}
    # Step 4
    Wait Until Element Exists    css:#header.teacher-view-nav    ${DELAY}
    # Step 5
    Wait Until Element Exists    id:tea.view.title    ${DELAY}
    Element Text Should Be    id:tea.view.title    Teacher's View
    # Step 6
    Wait Until Element Exists    id:overview.personalInfoForm    ${DELAY}
    # Step 7
    Close All Browsers

Invalid Login
    Open Browser    ${URL}    ${BROWSER}
    # Step 1
    Wait Until Element Is Not Visible    id:header.link.login    ${DELAY}
    # Step 2
    Wait Until Element Is Visible    id:loginPage.errorAlert    ${DELAY}
    # Step 3
    Close All Browsers

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}    options=add_argument("--headless")

    # Delay between steps
    Sleep    ${DELAY}

Wait Until Element Is Not Visible
    [Arguments]    ${selector}    ${delay}
    Wait Until Element Is Not Visible    ${selector}    ${delay}
    Sleep    ${DELAY}

Wait Until Element Is Visible
    [Arguments]    ${selector}    ${delay}
    Wait Until Element Is Visible    ${selector}    ${delay}
    Sleep    ${DELAY}

Wait Until Element Exists
    [Arguments]    ${selector}    ${delay}
    Wait Until Element Exists    ${selector}    ${delay}
    Sleep    ${DELAY}

Element Text Should Be
    [Arguments]    ${selector}    ${expected_text}
    ${text}    Get Text    ${selector}
    Should Be Equal    ${text}    ${expected_text}

Element Text Should Match
    [Arguments]    ${selector}    ${expected_text}
    ${text}    Get Text    ${selector}
    Should Match Regexp    ${text}    ${expected_text}

Close All Browsers
    Close All Browsers