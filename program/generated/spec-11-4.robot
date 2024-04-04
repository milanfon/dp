*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis

*** Test Cases ***
Check Benjamin Green, Mia Orange, Charlotte Purple, and Isabella Yellow are present
    [Setup]    Open Browser    ${URL}    Chrome
    Click Element    xpath=//*[@id="main"]
    Click Element    xpath=//*[@aria-label="Username"]
    Input Text    xpath=//*[@aria-label="Username"]    pedant
    Click Element    xpath=//*[@aria-label="Password"]
    Input Text    xpath=//*[@aria-label="Password"]    pass
    Click Element    xpath=//*[@aria-label="Login"]
    Click Element    xpath=//*[@aria-label="Subjects"]
    Click Element    xpath=//*[@aria-label="Students (4)"]
    Element Text Should Be    xpath=//*[@aria-label="Students (4)"]    Students 4
    Click Element    xpath=//*[@aria-label="closeModalButtonCross"]
    Element Text Should Be    xpath=//*[@aria-label="Students (4)"]    Students 4
    [Teardown]    Close Browser
