 ```ruby
*** Settings ***
Library           SeleniumLibrary
Browser           Chrome

*** Variables ***
username1         =    "brown"
password1         =    "pass"
username2         =    "bla"
password2         =    "pass"
username3         =    "lazy"
password3         =    "bla"

*** Test Case ***
Spec 1
    [Document]         ${json1}
    ${scenario1}       =    Process JSON    ${json1}

    [Document]         ${json2}
    ${scenario2}       =    Process JSON    ${json2}

    ${scenario1_steps} =    ${scenario1}    get steps
    ${scenario2_steps} =    ${scenario2}    get steps

    ${scenario1_steps}    **init**
    ${scenario2_steps}    **init**

    ${steps_count}      =    len    ${scenario1_steps}

    *** For *** ${i} in range ${steps_count}
        *** Set *** ${current_step}    ${scenario1_steps[${i}]}
        ${current_step['element']}    =    ${current_step['selectors'][0]}

        ${current_step_type}    =    ${current_step['type']}

        *** If *** ${current_step_type}    equals    "click"
            ${current_element} =    Get Element    ${current_element}
            Click Element    ${current_element}

        *** If *** ${current_step_type}    equals    "change"
            ${current_input} =    Get Element    ${current_element}
            Set Text    ${current_input}    ${current_step['value']}

        *** If *** ${current_step_type}    equals    "assert"
            *** If *** ${current_step['element']}    equals    "header.link.login"
                *** If ***    not    Element Is Visible    "#header.link.login"
                    Log    Element "header.link.login" not present
                    Exit

            *** If *** ${current_step['element']}    equals    "header.title.userHome"
                *** If ***    not    (Text Present In Element    "#header.title.userHome"    "Noah Brown")
                    Log    Inner text of "header.title.userHome" not equals "Noah Brown"
                    Exit

            *** If *** ${current_step['element']}    equals    "header.link.logout"
                *** If ***    not    Element Is Visible    "#header.link.logout"
                    Log    Element "header.link.logout" not present
                    Exit

            *** If *** ${current_step['element']}    equals    "#header.student-view-nav"
                *** If ***    not    Element Exists    "#header.student-view-nav"
                    Log    Element "#header.student-view-nav" not exists
                    Exit

            *** If *** ${current_step['element']}    equals    "stu.view.title"
                *** If ***    not    (Text Present In Element    "#stu.view.title"    "Student's View")
                    Log    Inner text of "stu.view.title" not equals "Student's View"
                    Exit

            *** If *** ${current_step['element']}    equals    "overview.personalInfoForm"
                *** If ***    not    Element Exists    "overview.personalInfoForm"
                    Log    Element "overview.personalInfoForm" not present
                    Exit

        *** End ***

        *** End ***

    *** End ***

    *** For *** ${i} in range ${steps_count}
        *** Set *** ${current_step}    ${scenario2_steps[${i}]}
        ${current_step['element']}    =    ${current_step['selectors'][0]}

        ${current_step_type}    =    ${current_step['type']}

        *** If *** ${current_step_type}    equals    "click"
            ${current_element} =    Get Element    ${current_element}
            Click Element    ${current_element}

        *** If *** ${current_step_type}    equals    "change"
            ${current_input} =    Get Element    ${current_element}
            Set Text    ${current_input}    ${current_step['value']}

        *** If *** ${current_step_type}    equals    "assert"
            *** If *** ${current_step['element']}    equals    "header.link.login"
                *** If ***    not    Element Is Visible    "#header.link.login"
                    Log    Element "header.link.login" not present
                    Exit

            *** If *** ${current_step['element']}    equals    "header.title.userHome"
                *** If ***    not    (Text Present In Element    "#header.title.userHome"    "John Lazy")
                    Log    Inner text of "header.title.userHome" not equals "John Lazy"
                    Exit

            *** If *** ${current_step['element']}    equals    "header.link.logout"
                *** If ***    not    Element Is Visible    "#header.link.logout"
                    Log    Element "header.link.logout" not present
                    Exit

            *** If *** ${current_step['element']}    equals    "#header.teacher-view-nav"
                *** If ***    not    Element Exists    "#header.teacher-view-nav"
                    Log    Element "#header.teacher-view-nav" not exists
                    Exit

            *** If *** ${current_step['element']}    equals    "tea.view.title"
                *** If ***    not    (Text Present In Element    "#tea.view.title"    "Teacher's View")
                    Log    Inner text of "tea.view.title" not equals "Teacher's View"
                    Exit

            *** If *** ${current_step['element']}    equals    "overview.personalInfoForm"
                *** If ***    not    Element Exists    "overview.personalInfoForm"
                    Log    Element "overview.personalInfoForm" not present
                    Exit

            *** If *** ${current_step_type}    equals    "assert"    and    ${current_step['element']}    equals    "loginPage.errorAlert"
                *** If ***    Element Exists    "loginPage.errorAlert"
                    Log    Element "loginPage.errorAlert" is visible
                *** Else ***
                    Log    Element "loginPage.errorAlert" is not present

                *** If ***    ${username1}    equals    "bla"    and    ${password1}    equals    "pass"
                    ${error_alert}    =    Get Element    "loginPage.errorAlert"
                    *** If ***    (Text Present In Element    ${error_alert}    "Invalid username or password")
                        Log    Invalid username or password
                        Exit

                *** If ***    ${username2}    equals    "lazy"    and    ${password2}    equals    "bla"
                    ${error_alert}    =    Get Element    "loginPage.errorAlert"
                    *** If ***    (Text Present In Element    ${error_alert}    "Invalid username or password")
                        Log    Invalid username or password
                        Exit

    *** End ***

*** Test Case ***
Spec 1 with invalid username and password
    ${json1}        =    *** Define ***
    ${json1}        =    {
        "title": "spec 1",
        "steps": []
    }

    ${json1}['steps'].append({
        "type": "setViewport",
        "width": 1501,
        "height": 1104,
        "deviceScaleFactor": 1,
        "isMobile": false,
        "hasTouch": false,
        "isLandscape": false
    })

    ${json1}['steps'].append({
        "type": "navigate",
        "url": "http://localhost:4680/tbuis/index.jsp",
        "assertedEvents": [
            {
                "type": "navigation",
                "url": "http://localhost:4680/tbuis/index.jsp",
                "title": "University information system"
            }
        ]
    })

    ${json1}['steps'].append({
        "type": "click",
        "target": "main",
        "selectors": [
            [
                "aria/Login"
            ],
            [
                "#header\\.link\\.login"
            ],
            [
                "xpath///*[@id=\"header.link.login\"]"
            ],
            [
                "pierce/#header\\.link\\.login"
            ],
            [
                "text/Login"
            ]
        ],
        "offsetY": 24,
        "offsetX": 22.671875,
        "assertedEvents": [
            {
                "type": "navigation",
                "url": "http://localhost:4680/tbuis/login",
                "title": "Login Page"
            }
        ]
    })

    ${json1}['steps'].append({
        "type": "click",
        "target": "main",
        "selectors": [
            [
                "aria/Username"
            ],
            [
                "#loginPage\\.userNameInput"
            ],
            [
                "xpath///*[@id=\"loginPage.userNameInput\"]"
            ],
            [
                "pierce/#loginPage\\.userNameInput"
            ]
        ],
        "offsetY": 9,
        "offsetX": 323.5
    })

    ${json1}['steps'].append({
        "type": "change",
        "value": "bla",
        "selectors": [
            [
                "aria/Username"
            ],
            [
                "#loginPage\\.userNameInput"
            ],
            [
                "xpath///*[@id=\"loginPage.userNameInput\"]"
            ],
            [
                "pierce/#loginPage\\.userNameInput"
            ]
        ],
        "target": "main"
    })

    ${json1}['steps'].append({
        "type": "change",
        "value": "pass",
        "selectors": [
            [
                "aria/Password"
            ],
            [
                "#loginPage\\.passwordInput"
            ],
            [
                "xpath///*[@id=\"loginPage.passwordInput\"]"
            ],
            [
                "pierce/#loginPage\\.passwordInput"
            ]
        ],
        "target": "main"
    })

    ${json1}['steps'].append({
        "type": "click",
        "target": "main",
        "selectors": [
            [
                "aria/Login[role=\"button\"]"
            ],
            [
                "#loginPage\\.loginFormSubmit"
            ],
            [
                "xpath///*[@id=\"loginPage.loginFormSubmit\"]"
            ],
            [
                "pierce/#loginPage\\.loginFormSubmit"
            ]
        ],
        "offsetY": 2,
        "offsetX": 20.5,
        "assertedEvents": [
            {
                "type": "navigation",
                "url": "http://localhost:4680/tbuis/",
                "title": "University information system"
            }
        ]
    })

    ${json1}['steps'].append({
        "type": "assert",
        "element": "loginPage.errorAlert"
    })

    *** Set *** ${output}    ${json1}

    *** Return *** ${output}

*** Test Case ***
Spec 1 with incorrect username and correct password
    ${json1}        =    *** Define ***
    ${json1}        =    {
        "title": "spec 1",