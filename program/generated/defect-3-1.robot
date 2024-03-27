*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open University Information System and Login
    Open Browser    http://localhost:4680/tbuis/    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    brown
    Press Key    xpath=//*[@id="loginPage.userNameInput"]    \\09
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    \\13
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    1s

Check Total Credits
    ${value}=    Get Text    xpath=//*[@id="stu.mySubjects.completedTable.creditAmount"]
    Should Be Equal As Strings    ${value}    0 Total Credits
