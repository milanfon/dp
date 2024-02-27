*** Settings ***
Documentation     DP Test 3 scenario automation for Alza.cz using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${ALZA_HOME}              https://www.alza.cz/
${PC_AND_NOTEBOOKS_URL}   https://www.alza.cz/pocitace-a-notebooky
${NOTEBOOKS_URL}          https://www.alza.cz/notebooky/18842920.htm
${GAMING_NOTEBOOKS_URL}   https://www.alza.cz/herni-notebooky/18848814.htm
${BROWSER}                Chrome

*** Test Cases ***
DP Test 3 Alza Navigation and Clicks
    [Documentation]    Automates navigation and clicks for Alza.cz website based on DP Test 3 recording.
    Open Browser    ${ALZA_HOME}    ${BROWSER}
    Set Window Size    1501    1104
    Location Should Be    ${ALZA_HOME}
    The Title Should Be    Alza.cz – rychlý a pohodlný nákup odkudkoliv | Alza.cz

    # Click on "Počítače a notebooky"
    Click Element    xpath=//*[@id="litp18890188"]/a
    Wait Until Page Contains Element    xpath=//h1[contains(text(),"Počítače a notebooky")]    10
    Location Should Be    ${PC_AND_NOTEBOOKS_URL}

    # Click on "Notebooky"
    Click Element    xpath=//*[@data-testid="category-tile"]/a/span
    Wait Until Page Contains Element    xpath=//h1[contains(text(),"Notebooky")]    10
    Location Should Be    ${NOTEBOOKS_URL}

    # Click on a specific category within "Notebooky", assuming "Herní notebooky"
    Click Element    xpath=//*[@id="content0"]/div[1]/div[2]/div[6]/div/div[1]/a[3]
    Wait Until Page Contains    Herní notebooky    10
    Location Should Be    ${GAMING_NOTEBOOKS_URL}

    [Teardown]    Close Browser

*** Keywords ***
The Title Should Be
    [Arguments]    ${expected_title}
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    ${expected_title}
