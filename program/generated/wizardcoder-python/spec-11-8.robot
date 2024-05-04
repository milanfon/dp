* Settings *
Library  SeleniumLibrary  speed  2

* Test Cases *
Test Case
  Open page
  Open browser  http://localhost:4680/tbuis/index.jsp  browser=Chrome
  Wait until page contains  Login
  Input text  id=loginPage.userNameInput  pedant
  Input text  id=loginPage.passwordInput  pass
  Click button  id=loginPage.loginFormSubmit
  Wait until page contains  My Subjects
  Click link  My Subjects
  Wait until page contains  Students (4)
  Click button  id=tea.mySubjects.table.listOfStudentsButton-2
  Wait until page contains  Benjamin Green
  Wait until page contains  Mia Orange
  Wait until page contains  Charlotte Purple
  Wait until page contains  Isabella Yellow
  Click button  id=closeModalButtonCross
  Wait until page contains  Subject
  Close browser 

 
* Keywords
  Wait until page contains
  [Arguments]  ${text}
  Wait until page contains element  ${text}  timeout=10s
  Wait until element contains  ${text}  ${text}  timeout=10s
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]  ${text}  timeout=10s
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-1"]  ${text}  timeout=10s
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-4"]  ${text}  timeout=10s
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-5"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-6"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-7"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-8"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-9"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-10"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-11"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-12"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-13"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-14"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-15"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-16"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-17"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-18"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-19"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-20"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-21"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-22"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-23"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-24"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-25"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-26"]  ${text}  timeout=10s 
  Wait until element contains  xpath=//*