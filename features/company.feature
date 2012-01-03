Feature: Web-SPP – Company Creation

Scenario:Successfully Create Company
  Given no company created
  And user on the new company creation page
  When user enters relyon as companyname
  And user enters rahul as responsible_person
  And user enters 2011-01-01 as dateofestablishment
  And user enters bangalore as address
  And user click on create
  Then it should create company
  And it should load Web-SPP Companies index page