*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Check Elements
    Open Browser    ${URL}    Chrome
    Set Viewport    1501    1104
    Click Element    aria/Login
    Click Element    aria/Username
    Input Text    aria/Username    maroon
    Press Keys    aria/Username    TAB
    Input Text    aria/Password    pass
    Press Keys    aria/Password    ENTER
    Click Element    aria/Other Subjects
    Click Element    id:stu.otherSubjects.table.enrollButton-10
    Wait Until Element Is Visible    id:stu.otherSubjects.successAlert    timeout=10s
    Click Element    aria/My Subjects
    Wait Until Element Is Visible    id:stu.mySubjects.enrolledTable.subjectRow-2    timeout=10s
    Close Browser

Teacher Login and Check Elements
    Open Browser    ${URL}    Chrome
    Set Viewport    1501    1104
    Click Element    aria/Login
    Click Element    aria/Username
    Input Text    aria/Username    strict
    Click Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Click Element    aria/My Subjects
    Click Element    id:tea.mySubjects.table.listOfStudentsButton-3
    Wait Until Element Is Visible    xpath://td[text()='William Maroon']    timeout=10s
    Close Browser