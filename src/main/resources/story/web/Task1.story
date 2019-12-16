Lifecycle:
Examples: /Tables/SignUP.table

Scenario: Open Trello main page
Given I am on the main application page
When I remove all cookies from the current domain
Then the page title is equal to 'Trello'


Scenario: Sign In
When I click on a link with the text  'Sign Up'
Then the page title is equal to 'Create a Trello Account'
When I change context to an element by the xpath '//*[@id='signup-form']'
When I click on an element by the xpath '//*[@id='signup']'
Then an element by the xpath '//*[@id='signup']' exists
Then an element by the xpath '//*[text()='Continue with Google']' exists
When I enter '<FullName>' in a field by the xpath '//*[@id='email']'
When I add '@ugly.email' to a field with the name 'email'
Then a button with the name 'google' does not exist
When I click on an element by the xpath '//*[@id='signup']'
When I enter '<FullName>' in a field by the xpath '//*[@id='name']'
When I enter '123456' in a field by the xpath '//*[@id='password']'
When I click on an element by the xpath '//*[@id='signup']'
Then an element by the xpath '//*[@id='error']' exists
When I enter '12345678' in a field by the xpath '//*[@id='password']'
When I click on an element by the xpath '//*[@id='signup']'
Then the text 'Welcome to Trello!' exists
Then an element by the xpath '//*[@data-test-id='board-name-input']' exists
Then an element by the xpath '//*[@class='first-board-image-base']' exists


Scenario: Retrieve API Key
Given I am on a page with the URL 'https://trello.com/app-key'
When I change context to an element by the xpath '//*[contains(@class,'center')]'
When I click on an element with the text 'I acknowledge that I have read and accept'
When I click on an element with the text 'Show API Key'
When I change context to an element by the xpath '//*[@id='key']'
When I set 'value' attribute value of the context element to the 'STORY' variable 'API_Key'


Scenario: Retrieve token
When I change context to an element by the xpath '//*[contains(@class,'center')]'
When I click on a link with the text 'Token'
When I switch to a new window
Then the text 'Server Token' exists
When I change context to an element by the xpath '//*[contains(@class,'account-content')]'
When I click on an element by the xpath '//*[@id='approveButton']'
When I change context to an element by the xpath '//*[@class='content']/pre'
When I set the text found in search context to the 'STORY' variable 'Token'


Scenario: Create First Board
Given request body: <requestBody>
When I set request headers:
|name  |value     |
|key   |${API_Key}|
|token |${Token}  |
When I issue a HTTP POST request for a resource with the URL 'https://api.trello.com/1/boards/<board_name><API><Token>'
Then the response code is equal to '200'
Then the response body contains '"id":'
Then the response body contains '"name":'
Then the response body contains '"shortUrl":'
Then the response body contains '"url":'
Examples:
|board_name       |API            |Token          |
|?name=Task1_Board|&key=${API_Key}|&token=${Token}|
|?name=New_Board  |&key=${API_Key}|&token=${Token}|
