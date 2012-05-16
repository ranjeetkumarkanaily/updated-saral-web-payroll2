Feature: Web-SPP – Company Creation

  Background:
      Given a valid user
      When User go to the login page
      Then User should see the text "Sign In"
      And User enters "Username" as "admin"
      And User enters "Password" as "default"
      And User clicks "Sign In" button
      Then User should see the text "Home"
      When User follow "Settings" link
      Then User should see the text "Company"


    Scenario: Creating an new company
      When User follow "Company" link
      Then User should see the text "Create a new Company"
      When User follow "Create a new Company" link
      Then User should see the text "New Company"
      And User enters "company_companyname" as "Relyon"
      And User enters "company_responsible_person" as "HSN"
      And User enters "doe" as "2011-01-01"
      And User enters "company_address" as "Bangalore"
      And User clicks "Create Company" button
      Then User should see the text "Relyon"

    Scenario: Editing Company Details
      Given User have company named Relyon
      When User follow "Company" link
      Then User should see the text "Edit Company"
      When User follow "Edit Company" link
      Then User should see the text "Editing Company"
      And User enters "company_companyname" as "Relyonsoft"
      And User enters "company_responsible_person" as "some"
      And User enters "doe" as "2011-01-01"
      And User enters "company_address" as "Tamilnadu"
      And User clicks "Update Company" button
      Then User should see the text "Company Details"

#  Background:
#    Given a valid user
#    When I go to the login page
#    Then I should see "Sign In"
#    And I fill in "Username" with "admin"
#    And I fill in "Password" with "default"
#    And I press "Sign In"
#    Then I should see "Home"
#    When I follow "Settings"
#    Then I should see "Company"
#
#
#  Scenario: Creating an new company
#    When I follow "Company"
#    Then I should see "Create a new Company"
#    When I follow "Create a new Company"
#    And I fill in "company_companyname" with "Relyon"
#    And I fill in "company_responsible_person" with "HSN"
#    And I fill in "doe" with "2011-01-01"
#    And I fill in "company_address" with "Bangalore"
#    And I press "Create Company"
#    Then I should see "Relyon"
#    And I should have 1 company
#
#  Scenario: Editing Company Details
#    Given I have company named Relyon
#    When I follow "Company"
#    Then I should see "Edit Company"
#    When I follow "Edit Company"
#    Then I should see "Editing Company"
#    And I fill in "company_companyname" with "Relyonsoft"
#    And I fill in "company_responsible_person" with "some"
#    And I fill in "doe" with "2011-01-01"
#    And I fill in "company_address" with "Tamilnadu"
#    And I press "Update Company"
#    Then I should see "Company Details"