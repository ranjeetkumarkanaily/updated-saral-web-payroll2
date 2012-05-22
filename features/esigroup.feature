Feature: Web-SPP – ESI Group

  Background:
    Given a valid user
    And User have ESI Group Karnakata created
    When User go to the login page
    Then User should see the text "Sign In"
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    Then User should see the text "Home"
    When User follow "Master" link
    Then User should see the text "ESI Group"


  Scenario: Creating an new ESI Group
    When User follow "ESI Group" link
    Then User should see the text "Listing ESI Groups"
    And User should see the text "Add New ESI Group"
    When User follow "Add New ESI Group" link
    Then User should see the text "New ESI Group"
    And User enters "esi_group_esi_group_name" as "Karnataka"
    And User enters "esi_group_address" as "Bangalore"
    And User enters "esi_group_esi_no" as "123"
    And User enters "esi_group_esi_local_office" as "Bangalore"
    And User enters "esi_group_user_id" as "test"
    And User enters "esi_group_password" as "test123"
    And User clicks "Save ESI Group" button
    Then User should see the text "Karnataka"

  Scenario: Editing ESI Group Detail
    When User follow "ESI Group" link
    Then User should see the text "Listing ESI Groups"
    And User should see the text "Operations"
    When User follow "Edit" link
    Then User should see the text "Editing ESI Group"
    And User enters "esi_group_esi_group_name" as "Karnataka"
    And User enters "esi_group_address" as "Mysore"
    And User enters "esi_group_esi_no" as "123"
    And User enters "esi_group_esi_local_office" as "Bangalore"
    And User enters "esi_group_user_id" as "test"
    And User enters "esi_group_password" as "test123"
    And User clicks "Save ESI Group" button
    Then User should see the text "Mysore"

  Scenario: Deleting an ESI Group
    When User follow "ESI Group" link
    Then User should see the text "Listing ESI Groups"
    And User should see the text "Operations"
    When User follow "Delete" link
    Then ESI Group "Karnataka" should be deleted
    And User should not see "Karnakata"