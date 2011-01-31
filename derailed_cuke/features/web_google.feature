Feature: Check the Google Search portal
In order to infer service availability
Admin should be able to
look for correct activity on service

Scenario: Google Search is working fine
Given I am on the Google Search portal
When I google derailed_cuke
Then I see required content on page
