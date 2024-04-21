*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}          1s

*** Test Cases ***
Open Page and Check Elements as Teacher
    Open Browser    chrome
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false
    Navigate To     http://localhost:4680/tbuis/index.jsp
    Wait Until Page Contains Element    aria/Login
    Click Element    aria/Login
    Wait Until Page Contains Element    aria/Username
    Input Text    aria/Username    pedant
    Wait Until Page Contains Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Wait Until Page Contains Element    aria/Others' Subjects
    Click Element    aria/Others' Subjects
    Wait Until Page Contains Element    tea.otherSubjects.table.participateButton-3
    Click Element    tea.otherSubjects.table.participateButton-3
    Wait Until Page Contains Element    aria/My Exam Dates
    Click Element    aria/My Exam Dates
    Wait Until Page Contains Element    aria/New Exam Dates
    Click Element    aria/New Exam Dates
    Wait Until Page Contains Element    aria/List of All Teachers
    Click Element    aria/List of All Teachers
    Wait Until Page Contains Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(),"Linear Algebra")]
    Wait Until Page Contains Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][text()="Alice Pedant"]
    Close Browser

Login as Student and Check Elements
    Open Browser    chrome
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false
    Navigate To     http://localhost:4680/tbuis/index.jsp
    Wait Until Page Contains Element    aria/Login
    Click Element    aria/Login
    Wait Until Page Contains Element    aria/Username
    Input Text    aria/Username    yellow
    Wait Until Page Contains Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Wait Until Page Contains Element    aria/Other Subjects
    Click Element    aria/Other Subjects
    Wait Until Page Contains Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(text(),"Linear Algebra")]
    Wait Until Page Contains Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(text(),"Alice Pedant")]
    Close Browser