from llmlingua import PromptCompressor

compressor = PromptCompressor(
        model_name="microsoft/llmlingua-2-bert-base-multilingual-cased-meetingbank",
        use_llmlingua2=True,
        device_map="mps"
    )

original_prompt = """
You're an intelligent programming assistant. You write Robot Framework scenarios and scripts using the Selenium Library. Insert delays between steps. Output code only, no text around. Use Chrome as browser. Locate elements using XPath. Close browser between scenarios.


Write Robot Framework scanario. Open page like in this JSON recording and then when you execute all the steps in the recording, do this:

- Check if element with id "stu.myExamDates.participantsModal.title" has appeared
- Check if there are <td> elements with values are present: "Benjamin Green", "Mia Orange", "Charlotte Purple" and "Isabella Yellow"

{
    "title": "spec 9",
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
            "offsetY": 29,
            "offsetX": 27.671875,
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
                    "#loginPage\\.userNameInput"
                ],
                [
                    "xpath///*[@id=\"loginPage.userNameInput\"]"
                ],
                [
                    "pierce/#loginPage\\.userNameInput"
                ]
            ],
            "offsetY": 24,
            "offsetX": 417.5
        },
        {
            "type": "change",
            "value": "orange",
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
        },
        {
            "type": "click",
            "target": "main",
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
            "offsetY": 18,
            "offsetX": 337.5
        },
        {
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
        },
        {
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
            "offsetY": 22,
            "offsetX": 54.5,
            "assertedEvents": [
                {
                    "type": "navigation",
                    "url": "http://localhost:4680/tbuis/student-view/overview",
                    "title": ""
                }
            ]
        },
        {
            "type": "click",
            "target": "main",
            "selectors": [
                [
                    "aria/My Exam Dates"
                ],
                [
                    "#stu\\.menu\\.myExamDates"
                ],
                [
                    "xpath///*[@id=\"stu.menu.myExamDates\"]"
                ],
                [
                    "pierce/#stu\\.menu\\.myExamDates"
                ],
                [
                    "text/My Exam Dates"
                ]
            ],
            "offsetY": 14,
            "offsetX": 81.5,
            "assertedEvents": [
                {
                    "type": "navigation",
                    "url": "http://localhost:4680/tbuis/student-view/myExamDates",
                    "title": ""
                }
            ]
        },
        {
            "type": "click",
            "target": "main",
            "selectors": [
                [
                    "#stu\\.myExamDates\\.table\\.ParticipantsButton-1"
                ],
                [
                    "xpath///*[@id=\"stu.myExamDates.table.ParticipantsButton-1\"]"
                ],
                [
                    "pierce/#stu\\.myExamDates\\.table\\.ParticipantsButton-1"
                ]
            ],
            "offsetY": 14.40625,
            "offsetX": 26.921875
        }
    ]
}
"""

results = compressor.compress_prompt_llmlingua2(
            original_prompt,
            rate=0.4,
            force_tokens=['\n', '.', '!', '?', ',', '\\'],
            chunk_end_tokens=['.', '\n'],
            return_word_label=True,
            drop_consecutive=True
        )

print(results.keys())
print(f"Compressed prompt: {results['compressed_prompt']}")
print(f"Original tokens: {results['origin_tokens']}")
print(f"Compressed tokens: {results['compressed_tokens']}")
print(f"Compression rate: {results['rate']}")
