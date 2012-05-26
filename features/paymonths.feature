Feature: Web-SPP – Paymonths

  Background:
    Given a valid user
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Settings" link

  Scenario: Creating an new Paymonth
    When User follow "Pay Months" link
    And User follow "Add New Pay Month" link
    Then User should see the text "New Pay Month"
    And User enters "paymonth_month_name" as "Jan/2012"
    And User clicks "Create Paymonth" button
    Then User should see the text "Jan/2012"

  Scenario: Viewing Paymonth Details
    Given User have paymonth jan/2012 created
    When User follow "Pay Months" link
    And User follow "Show" link
    Then User should see the text "Showing Pay Month"
    And User should see paymonth "jan/2012" details

  Scenario: Deleting an Paymonth
    Given User have paymonth jan/2012 created
    When User follow "Pay Months" link
    And User follow "Delete" link
    Then paymonth "jan/2012" should be deleted
    And User should see the text "Paymonth was successfully Deleted."

