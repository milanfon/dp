*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}       Chrome
${URL}           http://localhost:4680/tbuis

*** Test Cases ***
JSON Recording
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Set Window Size   1501    1104   
    Go To    ${URL}
    Page Should Contain    University information system
    Click Element    xpath=//*[@aria='Username']
    Input Text    xpath=//*[@aria='Username']    pedant
    Click Element    xpath=//*[@aria='Password']
    Input Text    xpath=//*[@aria='Password']    pass
    Click Element    xpath=//*[@aria='Login button']
    Click Element    xpath=//*[@aria='Subjects']
    Click Element    xpath=//*[@aria='/ Students 4 role button']
    Click Element    xpath=//*[@aria='closeModalButtonCross']
    Click Element    xpath=//*[@aria='mySubjects']
    Page Should Not Contain    No students
    [Teardown]    Close Browser
