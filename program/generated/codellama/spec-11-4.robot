*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    localhost

*** Test Cases ***
Check Students
    Open Page And Check Students

*** Keywords ***
Open Page And Check Students
    Open Browser    ${URL}    ${BROWSER}
    Set Viewport Size    1501    1104
    Wait Until Page Contains    University information system
    Click Element    xpath=//*[@aria-label="Subjects"]
    Wait Until Page Contains    Subjects
    Click Element    xpath=//*[@aria-label="/Students 4 role button "]
    Wait Until Page Contains Element    xpath=//*[@aria-label="Benjamin Green"]
    Element Should Be Visible    xpath=//*[@aria-label="Mia Orange"]
    Element Should Be Visible    xpath=//*[@aria-label="Charlotte Purple"]
    Element Should Be Visible    xpath=//*[@aria-label="Isabella Yellow"]
    Close Browser
