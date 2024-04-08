## Scenario: spec 17 teacher
### Scenario Outline
### Teacher
1. Open "http://localhost:4680/tbuis/index.jsp"
2. Click "Login"
3. Input "pedant" in "Username"
4. Input "pass" in "Password"
5. Click "Login"
6. Click "Others' Subjects"
7. Click "Participate" in "Others' Subjects"
8. Check if we're still on "Others' Subjects" page
9. Check if "tea.otherSubjects.successAlert" is visible
10. Click "My Exam Dates"
11. Check if "My Exam Dates" page is opened
11. Check if "Linear Algebra" is present
12. Check if "tea.myExamDates.table.noRecords-2" is present and contains "No exam dates."
13. Click "New Exam Dates"
14. Check if "New Exam Dates" page is opened
15. Click "List of All Teachers"
16. Check if "List of All Teachers" page is opened
17. Check if "//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]" contains "Linear Algebra" and "//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]" contains "Alice Pedant"

### Student
1. Open "http://localhost:4680/tbuis/index.jsp"
2. Click "Login"
3. Input "yellow" in "Username"
4. Input "pass" in "Password"
5. Click "Login"
6. Click "Other Subjects"
7. Check if "Other Subjects" page is opened
8. Check if "//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]" contains "Linear Algebra"
9. Check if "//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]" contains "Alice Pedant"



### Scenario

- Open Chrome browser
- Set viewport to 1501x104
- Navigate to "http://localhost:4680/tbuis/index.jsp"
- Click "Login"
- Input "pedant" in "Username"
- Input "pass" in "Password"
- Click "Login"
- Click "Others' Subjects"
- Click "Participate" in "Others' Subjects"
- Check if we're still on "Others' Subjects" page
- Check if "tea.otherSubjects.successAlert" is visible
- Click "My Exam Dates"
- Check if "My Exam Dates" page is opened
- Check if "Linear Algebra" is present
- Check if "tea.myExamDates.table.noRecords-2" is present and contains "No exam dates."
- Click "New Exam Dates"
- Check if "New Exam Dates" page is opened
- Click "List of All Teachers"
- Check if "List of All Teachers" page is opened
- Check if "//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]" contains "Linear Algebra" and "//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]" contains "Alice Pedant"
- Close browser
- Open Chrome browser
- Set viewport to 1501x104
- Navigate to "http://localhost:4680/tbuis/index.jsp"
- Click "Login"
- Input "yellow" in "Username"
- Input "pass" in "Password"
- Click "Login"
- Click "Other Subjects"
- Check if "Other Subjects" page is opened
- Check if "//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]" contains "Linear Algebra"
- Check if "//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]" contains "Alice Pedant"
- Close browser


### Keywords
- Open Browser
- Close Browser
- Input Text
- Click Element
- Element Should Be Visible
- Element Should Contain
- Element Should Be Present
- Element Should Contain
- Element Should Match
- Sleep
- Get Text

### Test Data
- URL: "http://localhost:4680/tbuis/index.jsp"
- Username: "pedant"
- Password: "pass"
- Username (student): "yellow"
- Password (student): "pass"

### Test Setup
- Chrome
- ChromeDriver
- SeleniumLibrary

### Test Teardown
- Close All Browsers

### Test Template
- Teacher
- Student

### Test Scenarios
- Teacher
- Student

### Test Results
- Teacher
- Student

### Test Results
- Teacher
  - Test Case: spec 17 teacher
  - Status: Pass
  - Test Scenarios:
    - Teacher:
  - Status: Pass
  - Student:
  - Status: Pass
- Student
  - Test Case: spec 17 student
  - Status: Pass
  - Test Scenarios:
    - Student:
  - Status: Pass

### Test Scenarios
- Teacher
  - Test Case: spec 17 teacher
  - Status: Pass
  - Test Scenarios:
    - Teacher:
  - Status: Pass
- Student
  - Test Case: spec 17 student
  - Status: Pass
  - Test Scenarios:
    - Student:
  - Status: Pass 