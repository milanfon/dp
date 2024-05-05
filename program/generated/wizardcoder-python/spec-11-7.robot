*** Settings ***
Library  SeleniumLibrary  timeout=20

*** Variables ***
${URL}  http://localhost:4680/tbuis/index.jsp
${BROWSER}  chrome

*** Keywords ***
Open Browser
  Open Browser  ${URL}  ${BROWSER}
  Maximize Browser Window

*** Test Cases ***
Open Page
  Open Browser
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Page Should Contain Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="header.link.login"]
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Input Text  xpath://*[@id="loginPage.userNameInput"]  pedant
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Click Element  xpath://*[@id="tea.menu.mySubjects"]
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Click Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Click Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Click Element  xpath://*[@id="closeModalButtonCross"]
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Element Should Contain  xpath://*[@id="tea.mySubjects.table.listOfStudents"]  Benjamin Green
  Element Should Contain  xpath://*[@id="tea.mySubjects.table.listOfStudents"]  Mia Orange
  Element Should Contain  xpath://*[@id="tea.mySubjects.table.listOfStudents"]  Charlotte Purple
  Element Should Contain  xpath://*[@id="tea.mySubjects.table.listOfStudents"]  Isabella Yellow
  Close Browser

*** Test Cases ***
Check Names
  Open Browser
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Page Should Contain Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="header.link.login"]
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Input Text  xpath://*[@id="loginPage.userNameInput"]  pedant
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Click Element  xpath://*[@id="tea.menu.mySubjects"]
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Click Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Click Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Click Element  xpath://*[@id="closeModalButtonCross"]
  ${delay}=  Evaluate  random.uniform(1.0, 3.0)  random
  Sleep  ${delay}
  Element Should Contain  xpath://*[@id="tea.mySubjects.table.listOfStudents"]  Benjamin Green
  Element Should Contain  xpath://*[@id="tea.mySubjects.table.listOfStudents"]  Mia Orange
  Element Should Contain  xpath://*[@id="tea.mySubjects.table.listOfStudents"]  Charlotte Purple
  Element Should Contain  xpath://*[@id="tea.mySubjects.table.listOfStudents"]  Isabella Yellow
  Close Browser

 
 
 
 
*** Keywords ***
Open Browser
  Open Browser  ${URL}  ${BROWSER}
  Maximize Browser Window

 
*** Keywords ***
Open Browser
  Open Browser  ${URL}  ${BROWSER}
  Maximize Browser Window 