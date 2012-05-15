Feature: Web-SPP – Paymonths

  Background:
    Given a valid user
    When I go to the login page
    Then I should see "Sign In"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "default"
    And I press "Sign In"
    Then I should see "Home"
    When I follow "Settings"
    Then I should see "Pay Months"


  Scenario: Creating an new company
    When I follow "Pay Months"
    Then I should see "Listing Pay Months"
    And I should see "Add New Pay Month"
    When I follow "Add New Pay Month"
    Then I should see "New Pay Month"
    And I fill in "paymonth_month_name" with "Jan/2012"
    And I press "Create Paymonth"
    Then I should see "Jan/2012"
#    And I should have 1 company

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