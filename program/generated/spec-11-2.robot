*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}       Chrome
${DELAY}          0
${URL}           http://localhost

*** Test Cases ***
JSON Recording
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Set Viewport   1501    1104    1    False    False    False
    Navigate To    ${URL}
    Page Should Contain    University information system
    Click Element    xpath=//*[@aria='Username']
    Input Text    xpath=//*[@aria='Username']    pedant
    Click Element    xpath=//*[@aria='Password']
    Input Text    xpath=//*[@aria='Password']    pass
    Click Element    xpath=//*[@aria='Login']
    Click Element    xpath=//*[@aria='Subjects']
    Click Element    xpath=//*[@aria='/ Students 4 role']
    Click Element    xpath=//*[@aria='closeModalButtonCross']
    Click Element    xpath=//*[@aria='mySubjects']
    Page Should Not Contain    No students
    [Teardown]    Close Browser
