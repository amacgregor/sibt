Feature: Projects track pageviews
  In order to assess interest on a project
  Projects should be able to 
  track and report total pageviews 

Scenario: Display total videos on PDP
    Given I am a user 
    When I view the project details pageviews
    Then I can see the total number of pageviews for that project

Scenario: Project view counter increases on refresh
    Given I am user
    And I am on a project details page
    When I refresh the page
    Then I should see the page count increase by one

