# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120228053057) do

  create_table "attendance_configurations", :force => true do |t|
    t.string   "attendance"
    t.string   "short_name"
    t.string   "salary_calendar_days"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "branches", :force => true do |t|
    t.string   "branch_name"
    t.string   "responsible_person"
    t.string   "address"
    t.integer  "pf_group_id"
    t.integer  "esi_group_id"
    t.integer  "pt_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "esi_applicable"
  end

  add_index "branches", ["esi_group_id"], :name => "index_branches_on_esi_group_id"
  add_index "branches", ["pf_group_id"], :name => "index_branches_on_pf_group_id"
  add_index "branches", ["pt_group_id"], :name => "index_branches_on_pt_group_id"

  create_table "classification_headings", :force => true do |t|
    t.string   "classification_heading_name"
    t.integer  "display_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classifications", :force => true do |t|
    t.integer  "classification_heading_id"
    t.string   "classification_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "companyname"
    t.string   "responsible_person"
    t.string   "address"
    t.string   "website"
    t.date     "dateofestablishment"
    t.boolean  "pf"
    t.boolean  "esi"
    t.string   "phonenumber1"
    t.string   "phonenumber2"
    t.string   "address2"
    t.string   "address3"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pt"
    t.boolean  "tds"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  create_table "default_values", :force => true do |t|
    t.string   "default_type"
    t.string   "value"
    t.integer  "value_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "department"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "designations", :force => true do |t|
    t.string   "designation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_details", :force => true do |t|
    t.integer  "employee_id"
    t.date     "effective_date"
    t.integer  "salary_group_id"
    t.decimal  "allotted_gross",              :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.hstore   "classification"
    t.integer  "branch_id"
    t.integer  "financial_institution_id"
    t.integer  "attendance_configuration_id"
    t.string   "bank_account_number"
    t.date     "effective_to"
  end

  create_table "employees", :force => true do |t|
    t.string   "empname"
    t.date     "date_of_joining"
    t.date     "date_of_leaving"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_of_birth"
    t.string   "marital_status"
    t.string   "father_name"
    t.string   "spouse_name"
    t.string   "gender"
    t.string   "present_res_no"
    t.string   "present_res_name"
    t.string   "present_street"
    t.string   "present_locality"
    t.string   "present_city"
    t.integer  "present_state_id"
    t.string   "perm_res_no"
    t.string   "perm_res_name"
    t.string   "perm_street"
    t.string   "perm_locality"
    t.string   "perm_city"
    t.integer  "perm_state_id"
    t.boolean  "perm_sameas_present"
    t.string   "email"
    t.string   "mobile"
    t.string   "refno"
    t.integer  "designation_id"
    t.integer  "department_id"
    t.integer  "grade_id"
    t.integer  "branch_id"
    t.integer  "financial_institution_id"
    t.string   "bank_account_number"
    t.boolean  "restrct_pf",               :default => false
  end

  create_table "esi_group_rates", :force => true do |t|
    t.integer  "esi_group_id"
    t.float    "employee_rate"
    t.float    "employer_rate"
    t.float    "cut_off"
    t.float    "minimum_limit_dailywage"
    t.string   "round_off"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "esi_groups", :force => true do |t|
    t.string   "esi_group_name"
    t.string   "address"
    t.string   "esi_no"
    t.string   "esi_local_office"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "financial_institutions", :force => true do |t|
    t.string   "name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "address_line3"
    t.string   "address_line4"
    t.string   "pincode"
    t.string   "branch_code"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", :force => true do |t|
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holidays", :force => true do |t|
    t.integer  "attendance_configuration_id"
    t.date     "holiday_date"
    t.string   "description"
    t.boolean  "national_holiday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hr_categories", :force => true do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hr_category_details", :force => true do |t|
    t.integer  "hr_category_id"
    t.string   "name"
    t.string   "data_type"
    t.boolean  "required"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hr_category_details", ["hr_category_id"], :name => "index_hr_category_details_on_hr_category_id"

# Could not dump table "hr_masters" because of following StandardError
#   Unknown type 'hstore' for column 'category_values'

  create_table "leave_details", :force => true do |t|
    t.integer  "employee_id"
    t.date     "leave_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leave_details", ["employee_id"], :name => "index_leave_details_on_employee_id"

  create_table "lops", :force => true do |t|
    t.integer  "employee_id"
    t.string   "month_year"
    t.float    "lop"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paymonths", :force => true do |t|
    t.integer  "month_year"
    t.integer  "number_of_days"
    t.date     "from_date"
    t.date     "to_date"
    t.string   "month_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paymonths", ["month_year"], :name => "index_paymonths_on_month_year"

  create_table "pf_esi_rates", :force => true do |t|
    t.integer  "paymonth_id"
    t.decimal  "pf_rate",           :precision => 8, :scale => 2
    t.decimal  "pf_cutoff",         :precision => 8, :scale => 2
    t.decimal  "esi_employee_rate", :precision => 8, :scale => 2
    t.decimal  "esi_employer_rate", :precision => 8, :scale => 2
    t.decimal  "esi_cutoff",        :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pf_group_rates", :force => true do |t|
    t.integer  "pf_group_id"
    t.integer  "paymonth_id"
    t.float    "account_number_21"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "pension_fund"
    t.float    "epf"
    t.float    "account_number_02"
    t.float    "account_number_22"
    t.string   "round_off"
    t.boolean  "restrict_employer_share"
    t.boolean  "restrict_employee_share_to_employer_share"
    t.float    "employer_epf"
    t.float    "cutoff"
  end

  create_table "pf_groups", :force => true do |t|
    t.string   "pf_group"
    t.string   "pf_number"
    t.string   "db_file_code"
    t.integer  "extension"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pt_group_rates", :force => true do |t|
    t.integer  "pt_group_id"
    t.integer  "paymonth_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pt_group_rates", ["paymonth_id"], :name => "index_pt_group_rates_on_paymonth_id"
  add_index "pt_group_rates", ["pt_group_id"], :name => "index_pt_group_rates_on_pt_group_id"

  create_table "pt_groups", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.string   "certificate_no"
    t.string   "pto_circle_no"
    t.string   "address"
    t.string   "return_period"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pt_groups", ["state_id"], :name => "index_pt_groups_on_state_id"

  create_table "pt_rates", :force => true do |t|
    t.integer  "pt_group_id"
    t.integer  "paymonth_id"
    t.decimal  "min_sal_range"
    t.decimal  "max_sal_range"
    t.decimal  "pt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pt_rates", ["paymonth_id"], :name => "index_pt_rates_on_paymonth_id"

  create_table "salaries", :force => true do |t|
    t.date     "effective_date"
    t.decimal  "salary_amount",      :precision => 8, :scale => 2
    t.integer  "employee_id"
    t.integer  "employee_detail_id"
    t.integer  "salary_head_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salaries", ["employee_detail_id"], :name => "index_salaries_on_employee_detail_id"
  add_index "salaries", ["employee_id"], :name => "index_salaries_on_employee_id"
  add_index "salaries", ["salary_head_id"], :name => "index_salaries_on_salary_head_id"

  create_table "salary_allotments", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "employee_detail_id"
    t.date     "effective_date"
    t.integer  "salary_head_id"
    t.decimal  "salary_allotment",       :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "salary_group_detail_id"
  end

  create_table "salary_group_details", :force => true do |t|
    t.string   "calc_type"
    t.string   "calculation"
    t.string   "based_on"
    t.integer  "salary_group_id"
    t.integer  "salary_head_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salary_group_details", ["salary_group_id"], :name => "index_salary_group_details_on_salary_group_id"
  add_index "salary_group_details", ["salary_head_id"], :name => "index_salary_group_details_on_salary_head_id"

  create_table "salary_groups", :force => true do |t|
    t.string   "salary_group_name"
    t.boolean  "based_on_gross"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salary_heads", :force => true do |t|
    t.string   "head_name"
    t.string   "short_name"
    t.string   "salary_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salary_totals", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "month_year_id"
    t.decimal  "alloted_gross", :precision => 8, :scale => 2
    t.decimal  "earned",        :precision => 8, :scale => 2
    t.decimal  "deducted",      :precision => 8, :scale => 2
    t.decimal  "net_salary",    :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "state_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "branches", "esi_groups", :name => "branches_esi_group_id_fk"
  add_foreign_key "branches", "pf_groups", :name => "branches_pf_group_id_fk"
  add_foreign_key "branches", "pt_groups", :name => "branches_pt_group_id_fk"

  add_foreign_key "employees", "branches", :name => "employees_branch_id_fk"
  add_foreign_key "employees", "departments", :name => "employees_department_id_fk"
  add_foreign_key "employees", "designations", :name => "employees_designation_id_fk"
  add_foreign_key "employees", "financial_institutions", :name => "employees_financial_institution_id_fk"
  add_foreign_key "employees", "grades", :name => "employees_grade_id_fk"

  add_foreign_key "esi_group_rates", "esi_groups", :name => "esi_group_rates_esi_group_id_fk"

  add_foreign_key "holidays", "attendance_configurations", :name => "holidays_attendance_configuration_id_fk"

  add_foreign_key "hr_category_details", "hr_categories", :name => "hr_category_details_hr_category_id_fk"

  add_foreign_key "hr_masters", "employees", :name => "hr_masters_employee_id_fk"
  add_foreign_key "hr_masters", "hr_categories", :name => "hr_masters_hr_category_id_fk"

  add_foreign_key "pf_group_rates", "paymonths", :name => "pf_group_rates_paymonth_id_fk"
  add_foreign_key "pf_group_rates", "pf_groups", :name => "pf_group_rates_pf_group_id_fk"

  add_foreign_key "pt_group_rates", "paymonths", :name => "pt_group_rates_paymonth_id_fk"
  add_foreign_key "pt_group_rates", "pt_groups", :name => "pt_group_rates_pt_group_id_fk"

  add_foreign_key "pt_rates", "pt_groups", :name => "pt_rates_pt_group_id_fk"

  add_foreign_key "salary_allotments", "salary_group_details", :name => "salary_allotments_salary_group_detail_id_fk"

end
