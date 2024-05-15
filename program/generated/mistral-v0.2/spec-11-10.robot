*** Settings ***
Library           SeleniumLibrary
SeleniumSettings   {
    "browserName"    "Chrome"
    "platformName"    "Windows 11"
    "acceptSslCerts"  "true"
    "implicit_wait"   "10"
}

*** Variables ***
${delay} =    1.0

*** Test Cases ***
Test Case Check Students
    [Documentation]     Check if "Benjamin Green", "Mia Orange", "Charlotte Purple" and "Isabella Yellow" are present on the page

    [Setup]
    Set Up
    Open Browser
    ${title} = Get Title
    Should Be ${title} "University information system"

    ${json} =    [
        {
            "type": "click",
            "target": "main",
            "selectors": [
                [
                    "aria/My Subjects"
                ],
                [
                    "#tea.menu.mySubjects"
                ],
                [
                    "xpath///*[@id=\"tea.menu.mySubjects\"]"
                ],
                [
                    "pierce/#tea.menu.mySubjects"
                ],
                [
                    "text/My Subjects"
                ]
            ],
            "offsetY": 27,
            "offsetX": 78.5,
            "assertedEvents": [
                {
                    "type": "navigation",
                    "url": "http://localhost:4680/tbuis/teacher-view/mySubjects",
                    "title": "Teacher's View"
                }
            ]
        },
        {
            "type": "click",
            "target": "main",
            "selectors": [
                [
                    "aria/Students (4)[role=\"button\"]"
                ],
                [
                    "#tea.mySubjects.table.listOfStudentsButton-0"
                ],
                [
                    "xpath///*[@id=\"tea.mySubjects.table.listOfStudentsButton-0\"]"
                ],
                [
                    "pierce/#tea.mySubjects.table.listOfStudentsButton-0"
                ],
                [
                    "text/Students (4)"
                ]
            ],
            "offsetY": 20.40625,
            "offsetX": 56.625
        }
    ]

    [Teardown]
    Close Browser

    [Step]
    Set Up
    Sleep ${delay}

    [Step]
    ${names} =    Get Elements    xpath=//*[@id="studentsTable"]/tbody/tr/td[1]

    [Step]
    ${students} =    List    ${names}

    [Step]
    Should Contain    ${students}    Benjamin Green
    Should Contain    ${students}    Mia Orange
    Should Contain    ${students}    Charlotte Purple
    Should Contain    ${students}    Isabella Yellow

    [Step]
    Click Element    xpath=//*[@id="closeModalButtonCross"]

    [Step]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]

    [Step]
    [Documentation]     Check if page contains the text "No students"

    [Step]
    ${text} =    Get Text    xpath=//*[@id="tea.mySubjects.table.tableBody"]

    [Step]
    Should Contain    ${text}    "No students"

    [Step]
    Sleep ${delay}