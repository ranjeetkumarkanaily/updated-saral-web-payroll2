pdf = Prawn::Document.new(
  :page_size => 'A4',
  :page_layout => :portrait)

pdf.text "#{@company.companyname}",:style => :bold
pdf.move_up 12
pdf.text "Generated on: #{Time.now.strftime('%d/%b/%Y %I:%M:%S %p')}",:style=> :bold, :align => :right
if @report_type != "Contact"
    pdf.move_down 15
    @report_type_change = @report_type.split("_").each{|word| word.capitalize!}.join(" ")
    pdf.text "#{@report_type_change} Report", :font_size => 11, :style => :bold, :align => :center
    if @employees.count > 0
        employees = []
        i=0

        @employees.each do |emp|
            employee = [
                        "#{i=i+1}",
                        "#{emp.refno}",
                        "#{emp.empname}",
                        "#{emp[@report_type]}"
                     ]
            employees << employee
        end
        pdf.move_down 5
        pdf.table(employees,
            :border_style => :grid,
            :headers => [
                            "Sl. No.", "Ref. No.", "Employee Name", "#{@report_type_change}"
                        ].map {
                                |text| Prawn::Table::Cell.new(:text => text, :font_style => :bold)
                              },
            :horizontal_padding => 10,
            :vertical_padding   => 5,
            :border_width       => 1,
            :position           => :left,
            :row_colors => ["FFFFFF","DDDDDD"],
            :font_size => 11,
            :width => 520,
            #:footers => [Page "#{pdf.page_count}"]
            ) do
        end
        pdf.page_count.times do |i|
            pdf.go_to_page(i+1)
            pdf.draw_text "Page #{(i+1)} of #{pdf.page_count}", :at => [470, 0]
        end
    else
        pdf.move_down 25
        pdf.text "No Record Found", :font_size => 11, :style => :bold, :align => :center
    end
else
    pdf.move_down 15
    pdf.text "Contact Detail Report", :font_size => 11, :style => :bold, :align => :center
    @employees.each do |employee|
        y_position = pdf.cursor - 50

        pdf.bounding_box [0, y_position], :width => 300, :height => 100 do
            pdf.transparent(0.0) { pdf.stroke_bounds }
            pdf.text "Ref No : #{employee.refno}",:align => :left, :leading => 3
            pdf.text "Employee Name : #{employee.empname}",:align => :left, :leading => 3
            pdf.text "Present Address :",:align => :left, :leading => 3
            pdf.text "#{employee.present_res_no}, #{employee.present_res_name}",:align => :left, :leading => 3
            pdf.text "#{employee.present_street}, #{employee.present_locality}",:align => :left, :leading => 3
            pdf.text "#{employee.present_city}, #{employee.present_state.state_name}",:align => :left, :leading => 3
        end
        pdf.stroke do
           pdf.move_down 25
           pdf.horizontal_rule
        end
        pdf.bounding_box [360, y_position], :width => 200, :height => 100 do
            pdf.transparent(0.0) { pdf.stroke_bounds }
            pdf.text "Email : #{employee.email}",:align => :left, :leading => 3
            pdf.text "Mobile : #{employee.mobile}",:align => :left, :leading => 3
        end
    end
    pdf.page_count.times do |i|
        pdf.go_to_page(i+1)
        pdf.draw_text "Page #{(i+1)} of #{pdf.page_count}", :at => [470, 0]
    end
end

