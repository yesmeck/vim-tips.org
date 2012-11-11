Feature: Tip list

  So that I can see all the tips.

  Scenario:
    Given a new tip
    When I visit All Tips page
    Then I should see the tip
