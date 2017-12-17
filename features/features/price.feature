Feature: Price

Scenario: Price is displayed
  Given the price is "£1.99"
  When I visit the page
  Then I should see "£1.99" as the "price"
