**Teacher**:


Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome

Click Element    aria/Login
Input Text    aria/Username    pedant
Input Text    aria/Password    pass
Click Element    aria/Login[role="button"]
Click Element    aria/Others' Subjects
Click Element    aria/Participate
Click Element    aria/My Exam Dates
Click Element    aria/New Exam Dates
Click Element    aria/List of All Teachers

New Page Should Contain Element    ${None}
New Page Should Contain Element    id=tea.otherSubjects.successAlert
New Page Should Contain Element    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]
New Page Should Contain    Linear Algebra    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]
New Page Should Contain    Linear Algebra    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]
New Page Should Contain    Linear Algebra    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]
New Page Should Contain    Alice Pedant    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]

Close Browser



**Student**:

Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome

Click Element    aria/Login
Input Text    aria/Username    yellow
Input Text    aria/Password    pass
Click Element    aria/Login[role="button"]
Click Element    aria/Other Subjects

New Page Should Contain    Linear Algebra    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]
New Page Should Contain    Alice Pedant    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]

Close Browser


*Note:*

- In the given JSON, the "pierce" selectors are ignored. They are used for internal purposes, and are not used in the Robot Framework script.
- The "setViewport" action is not used in the script, as it is not related to the scenario.
- The "assertedEvents" are not used in the script, as they are not related to the scenario. 