Given /^User have Branch Bangalore created$/ do
  Branch.create(:branch_name=> "Bangalore", :responsible_person=> "HSN", :address=> "Rajajinagara", :pf_group_id=> nil, :esi_group_id=> nil, :pt_group_id=> nil)
end

Then /^branch "(.*?)" should be deleted$/ do |value|
  Branch.delete(value)
end

Given /^Branch (.*?) created under PF Group (.*?)$/ do |branch,pf_grp|
   pf_group=PfGroup.create(:pf_group=> pf_grp, :pf_number=> "1234", :db_file_code=> "", :extension=> 1, :address=> "Bangalore",:user_id=> "test", :password=> "test123")
   branch=Branch.create(:branch_name=> branch, :responsible_person=> "HSN", :address=> "Rajajinagara", :pf_group_id=> pf_group.id, :esi_group_id=> nil, :pt_group_id=> nil)
   PfDetail.create(branch_id: branch.id, pf_group_id: pf_group.id, pf_effective_date: "2012-05-24")
end

Given /^Branch (.*?) created under ESI Group (.*?)$/ do |branch,esi_grp|
  esi_group=EsiGroup.create(:esi_group_name=> esi_grp, :address=> "Bangalore", :esi_no=> 123, :esi_local_office=> "Bangalore", :user_id=> "test", :password=> "test123")
  branch=Branch.create(:branch_name=> branch, :responsible_person=> "HSN", :address=> "Rajajinagara", :pf_group_id=> nil, :esi_group_id=> esi_group.id, :pt_group_id=> nil)
  EsiDetail.create(branch_id: branch.id, esi_group_id: esi_group.id, esi_effective_date: "2012-05-24")
end

Given /^Branch (.*?) created under PT Group (.*?)$/ do |branch,pt_grp|
  state=State.create(:state_name=> "Karnataka")
  pt_group=PtGroup.create(name: "Karnataka", state_id: state.id, certificate_no: "12345", pto_circle_no: "123", address: "Bangalore", return_period: "Half Yearly")
  branch=Branch.create(:branch_name=> branch, :responsible_person=> "HSN", :address=> "Rajajinagara", :pf_group_id=> nil, :esi_group_id=> nil, :pt_group_id=> pt_group.id)
  PtDetail.create(branch_id: branch.id, pt_group_id: pt_group.id, pt_effective_date: "2012-05-24")
end

