*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Check Elements as Teacher
    Open Browser    ${URL}    chrome
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false
    Click Element    aria/Login
    Click Element    aria/Username
    Input Text    aria/Username    pedant
    Click Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Click Element    aria/Others' Subjects
    Click Element    xpath///*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    2
    Element Should Be Visible    tea.otherSubjects.successAlert
    Go To    http://localhost:4680/tbuis/teacher-view/myExamDates
    Page Should Contain Element    tea.myExamDates.table.noRecords-2
    Page Should Contain    Linear Algebra
    Go To    http://localhost:4680/tbuis/teacher-view/newExamDates
    Page Should Contain Element    xpath//option[contains(text(), "Linear Algebra")]
    Go To    http://localhost:4680/tbuis/teacher-view/listOfAllTeachers
    Page Should Contain Element    xpath///*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(), "Linear Algebra")]
    Page Should Contain Element    xpath///*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][text()="Alice Pedant"]
    Close Browser

Open Page and Check Elements as Student
    Open Browser    ${URL}    chrome
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false
    Click Element    aria/Login
    Click Element    aria/Username
    Input Text    aria/Username    yellow
    Click Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Click Element    aria/Other Subjects
    Sleep    2
    Page Should Contain Element    xpath///*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(text(), "Linear Algebra")]
    Page Should Contain Element    xpath///*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(text(), "Alice Pedant"]
    Close Browser