*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680

*** Test Cases ***
Test Teacher View
    [Setup]    Open Browser    ${URL}    Chrome
    # Teacher steps
    # ...
    # Last Teacher step
    # Teacher assertions
    # ...
    # Close Browser

Test Student View
    [Setup]    Open Browser    ${URL}    Chrome
    # Student steps
    # ...
    # Last Student step
    # Student assertions
    # ...
    # Close Browser

*** Keywords ***
# Keywords for teacher steps
# ...

# Keywords for teacher assertions
# ...

# Keywords for student steps
# ...

# Keywords for student assertions
# ...