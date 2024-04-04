*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL}  http://localhost

*** Test Cases ***
Check Benjamin Green, Mia Orange, Charlotte Purple, and Isabella Yellow present
    [Setup]  Open Browser  ${URL}  ${BROWSER}
    Set Viewport Size  1501  1104
    Click Element  xpath=//*[@id="main"]
    Click Element  xpath=//*[@aria-label="Username"]
    Input Text  xpath=//*[@aria-label="Username"]  pedant
    Click Element  xpath=//*[@aria-label="Password"]
    Input Text  xpath=//*[@aria-label="Password"]  pass
    Click Element  xpath=//*[@aria-label="Login"]
    Click Element  xpath=//*[@aria-label="Subjects"]
    Click Element  xpath=//*[@aria-label="Students (4)"]
    [Teardown]  Close Browser