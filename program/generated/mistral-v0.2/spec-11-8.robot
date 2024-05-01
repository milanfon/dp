*** Settings ***
Library         SeleniumLibrary
SeleniumBrowser  Chrome

*** Variables ***
${DELAY}        2.0

*** Test Case ***
Check Students
    [Document]     ${recording}

    [Before]       Set Global Variables    {    "recording":    ${json}    }
    [Before]       Set Variable    ${json}    ${recording}

    [Document]     ${json}

    [Step]         Set Viewport
    [Step]         Navigate To    ${json["steps"][1]["url"]}

    [Step]         ${name_check}    Benji Green
    [Step]         ${name_check}    Mia Orange
    [Step]         ${name_check}    Charlotte Purple
    [Step]         ${name_check}    Isabella Yellow

    [Step]         Click    id=closeModalButtonCross

    [Step]         Click    id=tea.mySubjects.table.listOfStudentsButton-2

    [Step]         ${text_check}    Text Does Not Exist    No students

    [Step]         Go To    ${selenium_home}

    [Step]         ${browser}    Close

    [Step]         Log To Console    Test completed

*** Keywords ***
${name_check}
    [Arguments]    ${name}
    [Document]     ${name}
    [Step]         Element Should Exist
    [Step]         Element Should Contain
        [Arguments]    ${name}

${text_check}
    [Arguments]    ${text}
    [Document]     ${text}
    [Step]         Element Should Contain
        [Arguments]    ${text}

*** Custom Keywords ***
Go To
    [Arguments]    ${url}
    [Document]     ${url}
    [Step]         Navigate To    ${url}
    [Step]         Sleep    ${DELAY}

selenium_home
    [Document]     ${selenium_home}
    [Step]         Go To    ${selenium_home_url}
    [Step]         Sleep    ${DELAY}

*** Variables ***
selenium_home_url    http://localhost:4680/tbuis/

*** Test Cases ***
Test Scenario
    [Document]     Test Scenario
    [Step]         Test Case    Check Students

*** Suites ***
Test Suite
    [Document]     Test Suite
    [Test Cases]    Test Scenario

*** Suite Setup ***
    [Document]     Suite Setup
    [Step]         Open Browser

*** Suite Teardown ***
    [Document]     Suite Teardown
    [Step]         Close Browser