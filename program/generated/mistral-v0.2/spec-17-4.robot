*** Settings ***
Library               SeleniumLibrary
Browser               Chrome

*** Test Cases ***

Scenario1
    [Documentation]       Test case for teacher's actions
    [Tags]                teacher

    [Preparation]
    Set Viewport           1501    1104
    Set Browser Implicit Wait 10

    [Actions]
    Navigate To            http://localhost:4680/tbuis/index.jsp
    Login                 username=pedant    password=pass

    [Steps From JSON]
    ${json1}               JSON         '{"title": "spec 17 teacher", "steps": [...'
    ${steps1}               Set Variable  ${json1}['steps']

    ${i}                   Set Variable    ${i}=1
    ${len}                 Set Variable    ${len}=${len(${steps1})}

    {{         \
        ${step}         Set Variable    ${step}=${${steps1}[${i}]}
        ${selector}      Set Variable    ${selector}=${${step}[1]}
        ${target}        Set Variable    ${target}=${${step}[2]}
        ${offsetX}        Set Variable    ${offsetX}=${${step}[3]}
        ${offsetY}        Set Variable    ${offsetY}=${${step}[4]}
        ${delay}          Set Variable    ${delay}=${${step}[5]}
        ${assert}         Set Variable    ${assert}=${${step}[6]}

        Click Element        ${selector}    ${target}
        Sleep               ${delay}

        ${page_title}        Get Title
        ${page_title_re}     Set Variable    ${page_title_re}=    Regexp    ${page_title}    Others' Subjects
        Should               Title Matches    ${page_title_re}

        ${xpath}             Get Xpath    //*[@id="tea.otherSubjects.successAlert"]
        Should               Element Be Visible    ${xpath}

        ${page_title}        Get Title
        ${page_title_re_1}   Set Variable    ${page_title_re_1}=    Regexp    ${page_title}    My Exam Dates
        Should               Title Matches    ${page_title_re_1}
        ${my_exam_dates_xpath}   Get Xpath    //*[@id="tea.myExamDates.table.noRecords-2"]
        Should               Element Should Contain    ${my_exam_dates_xpath}    No exam dates.
        Should               Element Should Contain    //*[@id="tea.myExamDates.table"]    Linear Algebra

        Navigate To            http://localhost:4680/tbuis/teacher-view/newExamDates
        ${new_exam_dates_xpath}   Get Xpath    //option[.='Linear Algebra']
        Should               Element Should Exist    ${new_exam_dates_xpath}

        Navigate To            http://localhost:4680/tbuis/teacher-view/listOfAllTeachers
        ${teacher_xpath_1}    Get Xpath    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
        Should               Element Should Contain    ${teacher_xpath_1}    Linear Algebra
        ${teacher_xpath_2}    Get Xpath    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]
        Should               Element Should Contain    ${teacher_xpath_2}    Alice Pedant

        ${i}                 Set Variable    ${i}=${${i}+1}
        Until Key Pressed    escape
    }}

Scenario2
    [Documentation]       Test case for student's actions
    [Tags]                student

    [Preparation]
    Set Viewport           1501    1104
    Set Browser Implicit Wait 10

    [Actions]
    Navigate To            http://localhost:4680/tbuis/index.jsp
    Login                 username=yellow    password=pass

    [Steps From JSON]
    ${json2}               JSON         '{"title": "spec 17 student", "steps": [...'
    ${steps2}               Set Variable  ${json2}['steps']

    ${i}                   Set Variable    ${i}=1
    ${len}                 Set Variable    ${len}=${len(${steps2})}

    {{         \
        ${step}         Set Variable    ${step}=${${steps2}[${i}]}
        ${selector}      Set Variable    ${selector}=${${step}[1]}
        ${target}        Set Variable    ${target}=${${step}[2]}
        ${offsetX}        Set Variable    ${offsetX}=${${step}[3]}
        ${offsetY}        Set Variable    ${offsetY}=${${step}[4]}
        ${delay}          Set Variable    ${delay}=${${step}[5]}
        ${assert}         Set Variable    ${assert}=${${step}[6]}

        Click Element        ${selector}    ${target}
        Sleep               ${delay}

        ${page_title}        Get Title
        ${page_title_re}     Set Variable    ${page_title_re}=    Regexp    ${page_title}    Other Subjects
        Should               Title Matches    ${page_title_re}

        ${xpath}             Get Xpath    //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]
        Should               Element Should Contain    ${xpath}    Linear Algebra
        ${xpath}             Get Xpath    //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]
        Should               Element Should Contain    ${xpath}    Alice Pedant

        ${i}