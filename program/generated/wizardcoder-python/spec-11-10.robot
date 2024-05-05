*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    0.5s
${BROWSER_WIDTH}    1501
${BROWSER_HEIGHT}    104
${BROWSER_SCALE}    1
${BROWSER_IS_MOBILE}    False
${BROWSER_IS_LANDSCAPE}    False

*** Keywords ***
Open Browser
    Open Browser    ${URL}    browser=${BROWSER}    desired_capabilities=chromeOptions:androidPackage:com.android.chrome
    Set Window Size    ${BROWSER_WIDTH}    ${BROWSER_HEIGHT}
    Set Viewport Size    ${BROWSER_WIDTH}    ${BROWSER_HEIGHT}    ${BROWSER_SCALE}
    Set Window Position    ${BROWSER_IS_MOBILE}    ${BROWSER_IS_LANDSCAPE}

*** Test Cases ***
Test Scenario
    [Setup]    Open Browser
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Element Is Enabled    xpath=//*[@id="loginPage.userNameInput"]    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Enabled    xpath=//*[@id="tea.menu.mySubjects"]    ${DELAY}
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Wait Until Element Is Enabled    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]    ${DELAY}
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    ${students}    Get WebElements    xpath=//*[@id="tea.students.table"]//*[@class="name"]
    ${names}    Get Texts    ${students}
    @{names}    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    ${result}    Evaluate    any('name' in '${names}' for name in @{names})
    Should Be True    ${result}
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    ${result}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//*[contains(text(), 'No students')]    ${DELAY}
    Should Be True    ${result}
    Close Browser