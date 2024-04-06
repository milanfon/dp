## Solution
### First Scenario

| *Test Cases* | First Scenario |
|------------|--------------|
| *Test Cases* | Scenario with student |
| *Setup* | Open Browser | http://localhost:4680/tbuis/ | Chrome |
| *Check Element* | id:header.link.login | not present |
| *Check Element* | id:header.title.userHome | innerText:Noah Brown |
| *Check Element* | id:header.link.logout | present |
| *Check Element* | css:.student-view-nav | present |
| *Check Element* | id:stu.view.title | innerText:Student's View |
| *Check Element* | id:overview.personalInfoForm | present |
| *Close Browser* |


### Second Scenario

| *Test Cases* | Second Scenario |
|------------|--------------|
| *Test Cases* | Scenario with teacher |
| *Setup* | Open Browser | http://localhost:4680/tbuis/ | Chrome |
| *Check Element* | id:header.link.login | not present |
| *Check Element* | id:header.title.userHome | innerText:John Lazy |
| *Check Element* | id:header.link.logout | present |
| *Check Element* | css:.teacher-view-nav | present |
| *Check Element* | id:tea.view.title | innerText:Teacher's View |
| *Check Element* | id:overview.personalInfoForm | present |
| *Close Browser* |


### Third Scenario

| *Test Cases* | Third Scenario |
|------------|--------------|
| *Test Cases* | Scenario with wrong username |
| *Setup* | Open Browser | http://localhost:4680/tbuis/ | Chrome |
| *Check Element* | id:header.link.login | present |
| *Click Element* | id:header.link.login |
| *Check Element* | id:loginPage.userNameInput |
| *Input Text* | id:loginPage.userNameInput | bla |
| *Check Element* | id:loginPage.passwordInput |
| *Input Text* | id:loginPage.passwordInput | pass |
| *Click Element* | id:loginPage.loginFormSubmit |
| *Check Element* | id:loginPage.errorAlert |
| *Close Browser* |

### Fourth Scenario

| *Test Cases* | Fourth Scenario |
|------------|--------------|
| *Test Cases* | Scenario with wrong password |
| *Setup* | Open Browser | http://localhost:4680/tbuis/ | Chrome |
| *Check Element* | id:header.link.login | present |
| *Click Element* | id:header.link.login |
| *Check Element* | id:loginPage.userNameInput |
| *Input Text* | id:loginPage.userNameInput | lazy |
| *Check Element* | id:loginPage.passwordInput |
| *Input Text* | id:loginPage.passwordInput | bla |
| *Click Element* | id:loginPage.loginFormSubmit |
| *Check Element* | id:loginPage.errorAlert |
| *Close Browser* |


Note: In the third and fourth scenarios, the loginPage.errorAlert element is checked for presence and visibility, because it is the only element that is different in both scenarios. 