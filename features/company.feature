Feature: Web-SPP – Company Creation

  Background:
      Given a valid user
      When User go to the login page
      And User enters "Username" as "admin"
      And User enters "Password" as "default"
      And User clicks "Sign In" button
      And User follow "Settings" link

    Scenario: Creating an new company
      When User follow "Company" link
      And User follow "Create a new Company" link
      And User enters "company_companyname" as "Relyon"
      And User enters "company_responsible_person" as "HSN"
      And User enters "doe" as "2011-01-01"
      And User enters "company_address" as "Bangalore"
      And User clicks "Create Company" button
      Then Company count should increase by 1

    Scenario: Editing Company Details
      Given User have company named Relyon
      When User follow "Company" link
      And User follow "Edit Company" link
      And User enters "company_companyname" as "Relyonsoft"
      And User enters "company_responsible_person" as "some"
      And User enters "doe" as "2011-01-01"
      And User enters "company_address" as "Tamilnadu"
      And User clicks "Update Company" button
      Then User should see the text "Company Details"

    Scenario: Uploading company Document
      Given User have company named Relyon
      And User have required data created
      When User follow "Company" link
      And User follow "Documents" link
      And User follow "Add New Document" link
      And User upload the doc file
      And User clicks "Save File" button
      Then User should see the text "Company document was successfully created."

    Scenario: Download the uploaded company document
      Given User have docs.doc uploaded under company Relyon
      When User follow "Company" link
      And User follow "Documents" link
      And User follow "Download File" link
      Then User should get downloaded the file "docs.doc"

    Scenario: Delete the Uploaded file
      Given User have docs.doc uploaded under company Relyon
      When User follow "Company" link
      And User follow "Documents" link
      And User follow "Delete" link
      Then Company Document count should get decrement by 1
