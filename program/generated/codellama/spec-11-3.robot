*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:8080

*** Test Cases ***
Check Benjamin Green, Mia Orange, Charlotte Purple, and Isabella Yellow are present
    Open Browser To Page    ${URL}
    Check Students Are Present    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    Close Browser

*** Keywords ***
Open Browser To Page
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window

Check Students Are Present
    [Arguments]    @{students}
    ${students_present}    Set Variable    ${False}
    : FOR    ${student}    IN    @{students}
    \    ${students_present}    Run Keyword And Return Status    Element Should Be Visible    xpath=//*[contains(text(), '${student}')]
    \    Exit For Loop If    ${students_present}
    Should Be True    ${students_present}    msg=None of the students are present