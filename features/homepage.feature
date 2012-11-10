Feature: Homepage

  Show tip on homepage.

  Scenario: Show random tip
    Given a new tip
    Then I should see the tip on homepage
