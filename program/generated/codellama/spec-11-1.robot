

Here's the Robot Framework code:

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    localhost
${USERNAME}    pedant
${PASSWORD}    pass

*** Test Cases ***
Check Students Present
    Open Browser To Page
    Check Students Present On Page

*** Keywords ***
Open Browser To Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Browser Implicit Wait    10

Check Students Present On Page
    Set Viewport Size    1501    1104
    Navigate To Page
    Wait Until Page Contains Element    xpath=//*[@id="main"]/div[1]/div/div[2]/div/div[1]/div[1]/div[1]/div[1]/div/div/div[1]/div/div/div[1]/div/div/div[1]/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/div/