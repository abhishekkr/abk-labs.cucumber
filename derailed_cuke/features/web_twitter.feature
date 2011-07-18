Feature: Check the Twitter portal
In order to infer service availability
Admin should be able to
look for correct activity on service

Scenario: Twitter is working fine
Given I am on the Twitter portal
Then I should see "Twitter"
And I should see "Follow your interests"
