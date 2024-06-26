 ```ruby
*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Test Case ***
Scenario: Test teacher and student functionality

    *** Set Up ***
    Set Viewport 1501 1104

    *** Teacher ***
    [Document]      ${json}={%%"title": "spec 17 teacher", "steps": [%%}
                    ${json}={%{"type": "setViewport", "width": 1501, "height": 1104, "deviceScaleFactor": 1, "isMobile": false, "hasTouch": false, "isLandscape": false}%%}
                    ${json}={%{"type": "navigate", "url": "http://localhost:4680/tbuis/index.jsp", "assertedEvents": [%%}
                    ${json}={%{"type": "click", "target": "main", "selectors": [["aria/Login"]], "offsetY": 32, "offsetX": 39.671875, "assertedEvents": [%%}
                    ${json}={%{"type": "click", "target": "main", "selectors": [["aria/Username"]], "offsetY": 13, "offsetX": 278.5}%%}
                    ${json}={%{"type": "change", "value": "pedant", "selectors": [["aria/Username"]], "target": "main"}%%}
                    ${json}={%{"type": "click", "target": "main", "selectors": [["aria/Password"]], "offsetY": 12, "offsetX": 230.5}%%}
                    ${json}={%{"type": "change", "value": "pass", "selectors": [["aria/Password"]], "target": "main"}%%}
                    ${json}={%{"type": "click", "target": "main", "selectors": [["aria/Login[role=\"button\"]"]], "offsetY": 15, "offsetX": 4.5, "assertedEvents": [%%}
                    ${json}={%{"type": "click", "target": "main", "selectors": [["aria/Others' Subjects"]], "offsetY": 23, "offsetX": 75.5, "assertedEvents": [%%}
                    ${json}={%{"type": "click", "target": "main", "selectors": [["#tea.otherSubjects.table.participateButton-3"]], "offsetY": 14.40625, "offsetX": 18.6796875, "assertedEvents": [%%}
                    ${json}={%{"type": "click", "target": "main", "selectors": [["aria/My Exam Dates"]], "offsetY": 22, "offsetX": 110.5, "assertedEvents": [%%}
                    ${json}={%{"type": "click", "target": "main", "selectors": [["aria/New Exam Dates"]], "offsetY": 24, "offsetX": 82.5, "assertedEvents": [%%}
                    ${json}={%{"type": "click", "target": "main", "selectors": [["aria/List of All Teachers"]], "offsetY": 27, "offsetX": 70.5, "assertedEvents": [%%}
                    ${json}={%{"type": "click", "target": "main", "assertedEvents": [%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={%"]%%}
                    ${json}={