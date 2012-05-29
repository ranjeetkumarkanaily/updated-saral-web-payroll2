Feature: Web-SPP – Employee Salary Rate

  Background:
    Given a valid user
    And Given valid state Karnakata created
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Settings" link

  Scenario: Viewing employee salary rate
    Given Salary rate for employee XYZ defined
    When User follow "Employee's - Salary Rate" link
    Then User should see the text "XYZ"

  Scenario: Allot the salary for Employee
    Given Salary rate for employee XYZ defined
    When User follow "Employee's - Salary Rate" link
    And User clicks on the Listing Employee Salary not Allotted tab
    And User follow "Allot Salary" link
    And User enters "salAllotment__salary_allotment" as "2000"
    And User clicks "Save" button
    Then User should redirect to salary allotment index page

  Scenario: Edit Alloted the salary for Employee
    Given Salary rate alloted for employee Shivarudraiah defined
    When User follow "Employee's - Salary Rate" link
    And User clicks on the Listing Employee Salary Allotted tab
    And User follow "Edit" link
    And User enters "salAllotment__salary_allotment" as "2000"
    And User clicks "Save" button
    Then User should redirect to salary allotment index page


  Scenario: Employees salary allotment excel sample file
    When User follow "Employee's - Salary Rate" link
    And User follow "Generate Sample Template" link
    When User go to the salary allotment sample template page
    Then User should redirect to salary allotment generate_sample_excel_template

  Scenario: Employees salary allotment excel upload
    When User follow "Employee's - Salary Rate" link
    And User follow "Theoretical Salary Upload" link
    And User upload the employees salary allotment excel file
    And User clicks "Upload File" button
    When User go to the upload parse excel page
    Then User should redirect to salary allotments page



