 ```python
*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
URL             http://localhost:4680/tbuis/index.jsp

*** Test Case ***
Spec_1
    [Documentation]   Test case for spec 1
    [Documentation]   Open the page
    [Documentation]   Check elements for student view
    Open Browser          ${URL}

    [Documentation]   Check elements for student view
    [Check]    Element Should Not Exist    id=header.link.login
    [Check]    Element Should Contain    id=header.title.userHome    Noah Brown
    [Check]    Element Should Exist    #header.link.logout
    [Check]    Element Should Exist    #header.student-view-nav
    [Check]    Element Should Contain    id=stu.view.title    Student's View
    [Check]    Element Should Exist    id=overview.personalInfoForm

    [Documentation]   Open page from first JSON recording
    *** Set Global Variable ***
    ${json_data_student}    {
        "title": "spec 1",
        "steps": [
            {
                "type": "setViewport",
                "width": 1501,
                "height": 1104,
                "deviceScaleFactor": 1,
                "isMobile": false,
                "hasTouch": false,
                "isLandscape": false
            },
            {
                "type": "navigate",
                "url": "http://localhost:4680/tbuis/index.jsp",
                "assertedEvents": [
                    {
                        "type": "navigation",
                        "url": "http://localhost:4680/tbuis/index.jsp",
                        "title": "University information system"
                    }
                ]
            },
            {
                "type": "click",
                "target": "main",
                "selectors": [
                    [
                        "aria/Login"
                    ],
                    [
                        "#header.link.login"
                    ],
                    [
                        "xpath///*[@id=\"header.link.login\"]"
                    ],
                    [
                        "pierce/#header.link.login"
                    ],
                    [
                        "text/Login"
                    ]
                ],
                "offsetY": 19,
                "offsetX": 30.671875,
                "assertedEvents": [
                    {
                        "type": "navigation",
                        "url": "http://localhost:4680/tbuis/login",
                        "title": "Login Page"
                    }
                ]
            },
            {
                "type": "click",
                "target": "main",
                "selectors": [
                    [
                        "aria/Username"
                    ],
                    [
                        "#loginPage.userNameInput"
                    ],
                    [
                        "xpath///*[@id=\"loginPage.userNameInput\"]"
                    ],
                    [
                        "pierce/#loginPage.userNameInput"
                    ]
                ],
                "offsetY": 23,
                "offsetX": 260.5
            },
            {
                "type": "change",
                "value": "brown",
                "selectors": [
                    [
                        "aria/Username"
                    ],
                    [
                        "#loginPage.userNameInput"
                    ],
                    [
                        "xpath///*[@id=\"loginPage.userNameInput\"]"
                    ],
                    [
                        "pierce/#loginPage.userNameInput"
                    ]
                ],
                "target": "main"
            },
            {
                "type": "change",
                "value": "pass",
                "selectors": [
                    [
                        "aria/Password"
                    ],
                    [
                        "#loginPage.passwordInput"
                    ],
                    [
                        "xpath///*[@id=\"loginPage.passwordInput\"]"
                    ],
                    [
                        "pierce/#loginPage.passwordInput"
                    ]
                ],
                "target": "main"
            },
            {
                "type": "click",
                "target": "main",
                "selectors": [
                    [
                        "aria/Login[role=\"button\"]"
                    ],
                    [
                        "#loginPage.loginFormSubmit"
                    ],
                    [
                        "xpath///*[@id=\"loginPage.loginFormSubmit\"]"
                    ],
                    [
                        "pierce/#loginPage.loginFormSubmit"
                    ]
                ],
                "offsetY": 19,
                "offsetX": 35.5,
                "assertedEvents": [
                    {
                        "type": "navigation",
                        "url": "http://localhost:4680/tbuis/student-view/overview",
                        "title": "Student's View"
                    }
                ]
            }
        ]
    }

    *** Set Global Variable ***
    ${delay}                 5

    *** Set Global Variable ***
    ${driver}                 Create Webdriver    Chrome

    *** Set Global Variable ***
    ${execution_result}       Run Keywords        ${json_data_student}

    *** Teardown ***
    ${driver}.quit()

    *** Log ***    Student View test finished with status: ${execution_result.result}

    *** Test Case ***
    Spec_1_Teacher
        [Documentation]   Test case for spec 1 teacher
        [Documentation]   Open the page
        [Documentation]   Check elements for teacher view
        Open Browser          ${URL}

        [Documentation]   Check elements for teacher view
        [Check]    Element Should Not Exist    id=header.link.login
        [Check]    Element Should Contain    id=header.title.userHome    John Lazy
        [Check]    Element Should Exist    id=header.link.logout
        [Check]    Element Should Exist    #header.teacher-view-nav
        [Check]    Element Should Contain    id=tea.view.title    Teacher's View
        [Check]    Element Should Exist    id=overview.personalInfoForm

        [Documentation]   Open page from second JSON recording
        *** Set Global Variable ***
        ${json_data_teacher}    {
            "title": "spec 1 teacher",
            "steps": [
                {
                    "type": "setViewport",
                    "width": 1501,
                    "height": 1104,
                    "deviceScaleFactor": 1,
                    "isMobile": false,
                    "hasTouch": false,
                    "isLandscape": false
                },
                {
                    "type": "navigate",
                    "url": "http://localhost:4680/tbuis/index.jsp",
                    "assertedEvents": [
                        {
                            "type": "navigation",
                            "url": "http://localhost:4680/tbuis/index.jsp",
                            "title": "University information system"
                        }
                    ]
                },
                {
                    "type": "click",
                    "target": "main",
                    "selectors": [
                        [
                            "aria/Login"
                        ],
                        [
                            "#header.link.login"
                        ],
                        [
                            "xpath///*[@id=\"header.link.login\"]"
                        ],
                        [
                            "pierce/#header.link.login"
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
                },
                {
                    "type": "click",
                    "target": "main",
                    "selectors": [
                        [
                            "aria/Username"
                        ],
                        [
                            "#loginPage.userNameInput"
                        ],
                        [
                            "xpath///*[@id=\"loginPage.userNameInput\"]"
                        ],
                        [
                            "pierce/#loginPage.userNameInput"
                        ]
                    ],
                    "offsetY": 9,
                    "offsetX": 323.5
                },
                {
                    "type": "change",
                    "value": "lazy",
                    "selectors": [
                        [
                            "aria/Username"
                        ],
                        [
                            "#loginPage.userNameInput"
                        ],
                        [
                            "xpath///*[@id=\"loginPage.userNameInput\"]"
                        ],
                        [
                            "pierce/#loginPage.userNameInput"
                        ]
                    ],
                    "target": "main"
                },
                {
                    "type": "change",
                    "value": "pass",
                    "selectors": [
                        [
                            "aria/Password"
                        ],
                        [
                            "#loginPage.passwordInput"
                        ],
                        [
                            "xpath///*[@id=\"loginPage.passwordInput\"]"
                        ],
                        [
                            "pierce/#loginPage.passwordInput"
                        ]
                    ],
                    "target": "main"
                },
                {
                    "type": "click",
                    "target": "main",
                    "selectors": [
                        [
                            "aria/Login[role=\"button\"]"
                        ],
                        [
                            "#loginPage.loginFormSubmit"
                        ],
                        [
                            "xpath///*[@id=\"loginPage.loginFormSubmit\"]"
                        ],
                        [
                            "pierce/#loginPage.loginFormSubmit"
                        ]
                    ],
                    "offsetY": 2,
                    "offsetX": 20.5,
                    "assertedEvents": [
                        {
                            "type": "navigation",
                            "url": "http://localhost:4680/tbuis/teacher-view/overview",
                            "title": "Teacher's View"
                        }
                    ]
                }
            ]
        }

        *** Set Global Variable ***
        ${delay}                 5

        *** Set Global Variable ***
        ${driver}                 Create Webdriver    Chrome

        *** Set Global Variable ***
        ${execution_result}       Run Keywords        ${json_data_teacher}

        *** Teardown ***
        ${driver}.quit()

        *** Log ***    Teacher View test finished with status: ${execution_result.result}

    *** Test Case ***
    Spec_1_Login_Invalid
        [Documentation]   Test case for spec 1 with invalid login
        [Documentation]   Open the page
        [Documentation]   Try login with invalid credentials
        Open Browser          ${URL}

        [Documentation]   Try login with invalid credentials
        [Check]    Element Should Exist    id=loginPage.errorAlert
        [Check]    Element Should Exist    id=loginPage.errorAlert

        [Documentation]   Try login with invalid credentials (username: bla, password: pass)
        *** Set Variable ***    ${username}    bla
        *** Set Variable ***   