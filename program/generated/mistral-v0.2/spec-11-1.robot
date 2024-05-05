*** Settings ***
Library         SeleniumLibrary
Selenium        Chrome

*** Variables ***
${DELAY}        2.0s

*** Test Case ***
Example Test
    [Documentation]         Test case to check presence of specific names on the page

    [Setup]         Set Up
        Set Viewport 1501 1104
        Set Browser Implicit Wait 10

    [Teardown]         Tear Down
        Close Browser

    [Actions]         Open page
        ${step1} =    Set Variable    {}
        ${step1} +=    Navigate To    ${URL}
        ${step1} +=    Element Should Be Visible    Log In Link    Name=Login

    [Actions]         Login
        ${step2} =    Set Variable    {}
        ${step2} +=    Click Element    Log In Link    Name=Login
        ${step2} +=    Input Text    Username Input    ${Username}
        ${step2} +=    Input Text    Password Input    ${Password}
        ${step2} +=    Click Element    Login Form Submit    Name=Login

    [Actions]         Check names presence
        ${step3} =    Set Variable    {}
        ${step3} +=    Click Element    Students (4)    Name=Students (4)
        ${step3} +=    Wait Until Element Is Visible    CloseModalButtonCross    Name=closeModalButtonCross:xpath
        ${step3} +=    Click Element    Students (3)    Name=Students (3)
        ${step3} +=    Wait Until Page Contains    No students
        ${step3} +=    Should Contain    Page Source    ${Names}

    ${Names} =    Ben Green Mia Orange Charlotte Purple Isabella Yellow

    [Teardown]         Clean Up
        ${step4} =    Set Variable    {}
        ${step4} +=    Click Element    Close Modal Button Cross    Name=closeModalButtonCross

    [Teardown]         Delay
        ${step5} =    Set Variable    {}
        ${step5} +=    Run Keyword And Ignore Status    Sleep    ${DELAY}

    ${step1}
    ${step2}
    ${step3}
    ${step4}
    ${step5}

    [Documentation]         This test case opens the page, logs in, checks the presence of specific names on the page, and closes the browser