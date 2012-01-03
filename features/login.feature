Feature: Web-SPP
Scenario:Successful Login
Given user on the Web-SPP Login page
When user enter admin as username
And user enter default as password
And user click on Login button
Then it should login successfully
And it should load Web-SPP home page