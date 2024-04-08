*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp
${DELAY}    0.5

*** Test Cases ***
Test Scenario
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    ${username}    Set Variable    pedant
    ${password}    Set Variable    pass
    ${loginPage}    Set Variable    ${URL}login

    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    ${tea_table_rows}    Get WebElements    xpath=//*[@id="tea.mySubjects.table"]//tr
    ${names_list}    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    :FOR    ${tea_table_row}    IN    @{tea_table_rows}
    \    ${row_text}    Get Text    ${tea_table_row}
    \    ${row_text_list}    Split String    ${row_text}    ${SPACE}
    \    ${first_name}    Get From List    ${row_text_list}    0
    \    ${last_name}    Get From List    ${row_text_list}    1
    \    ${name}    Catenate    ${first_name}    ${last_name}
    \    ${name_lower}    Convert To Lowercase    ${name}
    \    ${name_exists}    Evaluate    '${name_lower}' in ${names_list}
    \    ${name_exists}    Evaluate    ${name_exists}
    \    Run Keyword If    ${name_exists}    Exit For Loop
    \    Run Keyword If    ${name_exists}    Log    ${name} is in the table
    \    Run Keyword If    ${name_exists}    Log    ${name} is in the table
    \    Run Keyword If    ${name_exists}    Log    ${name} is in the table
    \    Run Keyword If    ${name_exists}    Log    ${name} is in the table
    Close Browser