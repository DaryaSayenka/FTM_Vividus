Lifecycle:
Examples: /Tables/SignIn.table

Scenario: Open Trello main page
Given I am on the main application page
Then the page title is equal to 'Trello'


Scenario: Sign In
When I click on a link with the text  'Log In'
When I change context to an element by the xpath '//*[@class='login-password-container']'
When I click on an element by the xpath '//*[@id='login']'
Then an element by the xpath '//*[@id='error']' exists
When I enter '<email>' in a field by the xpath '//*[@id='user']'
When I click on an element by the xpath '//*[@id='login']'
When I click on an element by the xpath '//*[@id='login']'
When I enter '123456' in a field by the xpath '//*[@id='password']'
When I click on an element by the xpath '//*[@id='login']'
Then an element by the xpath '//*[@id='error']' exists
When I enter '<password>' in a field by the xpath '//*[@id='password']'
When I click on an element by the xpath '//*[@id='login']'
When I change context to an element by the xpath '//*[contains(@class,'sidebar-container')]'
When I click on an element with the text 'Boards'
When I change context to an element by the xpath '//*[@class='content-all-boards']'
When I click on an element by the xpath '(//*[contains(@class,'list-item')])[1]'
When I change context to an element by the xpath '//*[@id='board']'
Then an element by the xpath '//*[text()='Things To Do']' exists
Then an element by the xpath '//*[text()='Doing']' exists
Then an element by the xpath '//*[text()='Done']' exists


Scenario: Verify user Profile
When I change context to an element by the xpath '//*[@id='header']'
When I click on an element by the xpath '//*[contains(@data-test-id,'header-member')]'
When I change context to an element by the xpath '//*[contains(@data-test-id,'member-menu-popover')]'
When I click on an element by the xpath '//*[contains(@data-test-id,'menu-profile')]'


Scenario: Navigate to all pages
When I change context to an element by the xpath '//*[@id='content']'
When I click on an element with the text 'Profile and Visibility'
When I change context to an element by the xpath '//*[@id='content']'
When I COMPARE_AGAINST baseline with `Profile`
When I change context to an element by the xpath '//*[contains(@class,'tabbed-pane-nav ')]'
When I click on an element with the text 'Activity'
When I change context to an element by the xpath '//*[@class='window-module']'
When I COMPARE_AGAINST baseline with `Activity`
When I change context to an element by the xpath '//*[contains(@class,'tabbed-pane-nav ')]'
When I click on an element with the text 'Cards'
When I change context to an element by the xpath '//*[contains(@class,'mod-wider')]'
When I COMPARE_AGAINST baseline with `Cards`
When I change context to an element by the xpath '//*[contains(@class,'tabbed-pane-nav ')]'
When I click on an element with the text 'Settings'
When I change context to an element by the xpath '//*[contains(@class,'content member-account')]'
When I COMPARE_AGAINST baseline with `Settings`
When I change context to an element by the xpath '//*[contains(@class,'tabbed-pane-nav ')]'
When I click on an element with the text ' Trello Gold'
When I change context to an element by the xpath '//*[contains(@class,'main-col-wrapper')]'
When I COMPARE_AGAINST baseline with `Trello Gold`
When I remove all cookies from the current domain
