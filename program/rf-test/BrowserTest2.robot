*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${url}           https://milanfon.cz/
${forum_page_title}    Forum - milanfon
${discussion_page_title}    Diskuze - milanfon
${pagination_next_title}    Další strana

*** Test Cases ***
DP Test 1
    [Documentation]     This test case performs the actions mentioned in the JSON recording.

    Open Browser             ${url}      Chrome

    # Set Viewport (equivalent to 'setViewport' in your JSON)
    # You may want to add this line for better test results if necessary
    # Set Window Size        1501, 1104

    Element Should Contain  main    aria-label:Diskuze

    # Click on the first discussion link (equivalent to 'click' in your JSON)
    Click Link Text         Aria/Diskuze
    [Title Should Be]     Diskuze - milanfon

    # Scroll and click the pagination next button (equivalent to 'click' in your JSON)
    Scroll Into View By Name   main
    Click Button             xpath=//div[contains(@class, 'ipsPagination_next')]/a[@title='Další strana']
    [Title Should Be]     Diskuze - Strana 2 - milanfon

    # Tear Down
    Close Browser
