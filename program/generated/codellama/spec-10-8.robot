*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/
${browser}        Chrome

*** Test Cases ***
Teacher Test
    [Setup]    Open Browser    ${url}    ${browser}
    # Teacher steps
    # ...
    # ...
    # Last step in the Teacher Test
    [Teardown]    Close Browser

Student Test
    [Setup]    Open Browser    ${url}    ${browser}
    # Student steps
    # ...
    # ...
    # Last step in the Student Test
    [Teardown]    Close Browser

*** Keywords ***
# Keywords for the teacher steps
# ...
# ...

# Keywords for the student steps
# ...
# ...