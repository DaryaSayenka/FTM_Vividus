Lifecycle:
Examples: /Tables/SignIn.table

Scenario: SignIn
Given I am on the main application page
Then the page title is equal to 'Trello'
When I click on a link with the text  'Log In'
When I SignIn with <email> and <password>
When I change context to an element by the xpath '//*[contains(@class,'sidebar-container')]'
When I click on an element with the text 'Boards'
When I change context to an element by the xpath '//*[@class='content-all-boards']'
When I click on an element by the xpath '(//*[contains(@class,'list-item')])[1]'
When I change context to an element by the xpath '//*[@class='board-canvas']'
When I find >= '1' elements by By.xpath(//*[@class='js-list list-wrapper']) and for each element do
|step|
|Then an element by the xpath '//*[contains(@class,'editing-target')]' exists|
|Then an element by the xpath '//*[contains(@class,'open-card-composer')]' exists|

