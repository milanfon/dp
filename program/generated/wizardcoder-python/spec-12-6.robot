Scenario: spec 12 teacher

    Given Browser is opened to login page
    When user "scatterbrained" logs in to the system
    Then page "Teacher's View" is opened
    When user clicks "My Exam Dates" in the menu
    Then page "My Exam Dates" is opened
    When user clicks "X" button to cancel the exam
    Then page "My Exam Dates" is opened
    When user clicks "Set Evaluation" in the menu
    Then page "Set Evaluation" is opened
    When user clicks "Evaluation Table" in the menu
    Then page "Evaluation Table" is opened
    When user clicks "Filter" button
    Then page "Evaluation Table" is opened
    When user selects "1202" subject
    Then page "Evaluation Table" is opened


Scenario: spec 12 student
    Given Browser is opened to login page
    When user "orange" logs in to the system
    Then page "Overview" is opened
    When user clicks "My Exam Dates" in the menu
    Then page "My Exam Dates" is opened


Scenario: Check if "Computation Structures" is not present
    When user "orange" logs in to the system
    Then page "Overview" is opened
    When user clicks "My Exam Dates" in the menu
    Then page "My Exam Dates" is opened
    Then "Computation Structures" is not present in the page 