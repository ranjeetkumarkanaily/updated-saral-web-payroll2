pdf = Prawn::Document.new(
  :page_size => 'A4',
  :page_layout => :landscape)
if @genSal
    pdf.text "Employee wise Salary Details", :font_size => 11, :style => :bold, :align => :center

    salaries = []
    @genSal.each do |sal|
        salary = [
                    "#{sal.employee_id}",
                    "#{sal.employee_name}",
                    "#{sal.basic}",
                    "#{sal.da}",
                    "#{sal.hra}",
                    "#{sal.conveyance}",
                    "#{sal.allowance}",
                    "#{sal.total_earning}",
                    "#{sal.pf}",
                    "#{sal.esi}",
                    "#{sal.loss_of_pay}",
                    "#{sal.total_deduction}",
                    "#{sal.net_salary}"
                 ]
        salaries << salary
    end
    pdf.move_down 5
    pdf.table(salaries,
        :border_style => :grid,
        :headers => [
                        "ID", "Name", "Basic", "DA", "HRA", "Conveyance", "Allowance", "Total Earning", "PF", "ESI", "LOP",
                        "Total Deduction", "Net Salary"
                    ].map {
                            |text| Prawn::Table::Cell.new(:text => text, :font_style => :bold)
                          },
        :horizontal_padding => 10,
        :vertical_padding   => 5,
        :border_width       => 1,
        :position           => :left,
        :row_colors => ["FFFFFF","DDDDDD"],
        :font_size => 11,
        :width => 775,
        #:footers => [Page "#{pdf.page_count}"]
        ) do

    end

    pdf.page_count.times do |i|
    pdf.go_to_page(i+1)
    pdf.draw_text "Page #{(i+1)} of #{pdf.page_count}", :at => [700, 0]
    end
else
    pdf.text "No Record Found", :font_size => 11, :style => :bold, :align => :center
end


          contact = ["#{employee.refno}",
                    "#{employee.empname}",
                    "#{employee.mobile}",
                    "#{employee.email}",
                    "#{employee.present_res_no}",
                    "#{employee.present_res_name}",
                    "#{employee.present_street}",
                    "#{employee.present_locality}",
                    "#{employee.present_city}",
                    "#{employee.present_state_id}"