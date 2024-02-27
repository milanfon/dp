*** Settings ***
Documentation     DP Test 4 scenario automation for htmx.org using SeleniumLibrary.
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${HTMX_HOME}              https://htmx.org/
${BROWSER}                Chrome

*** Test Cases ***
DP Test 4 HTMX Website Navigation
    [Documentation]    Automates navigation and interaction on the htmx.org website based on DP Test 4 recording.
    Open Browser    ${HTMX_HOME}    ${BROWSER}
    Set Window Size    1501    1104
    Location Should Be    ${HTMX_HOME}
    The Title Should Be    </> htmx - high power tools for html

    # Initial click in the navigation, assuming it's the "Docs" link or similar
    Click Element    xpath=//*[@id="nav"]/div[1]/div[1]/a
    Wait For Condition    return document.readyState == 'complete'
    Sleep    2s

    # Click on "Triggers" link under "Docs" or similar section
    Click Element    xpath=//*[@id="contents"]/ul/li[3]/ul/li[1]/a
    Wait For Condition    return document.readyState == 'complete'

    # Click on "Swapping" link under the same section
    Click Element    xpath=//*[@id="contents"]/ul/li[3]/ul/li[4]/a
    Wait For Condition    return document.readyState == 'complete'

    [Teardown]    Close Browser

*** Keywords ***
The Title Should Be
    [Arguments]    ${expected_title}
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    ${expected_title}
