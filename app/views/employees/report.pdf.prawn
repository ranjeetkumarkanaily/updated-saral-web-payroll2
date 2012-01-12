pdf = Prawn::Document.new(
  :page_size => 'A4',
  :page_layout => :portrait)

pdf.text "#{@company.companyname}",:style => :bold
pdf.move_up 12
pdf.text "Generated on: #{Time.now.strftime('%d/%b/%Y %I:%M:%S %p')}",:style=> :bold, :align => :right
if @report_type != "Contact"
    if @employees
        pdf.move_down 15
        @report_type_change = @report_type.split("_").each{|word| word.capitalize!}.join(" ")
        pdf.text "#{@report_type_change} Report", :font_size => 11, :style => :bold, :align => :center

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
        pdf.text "No Record Found", :font_size => 11, :style => :bold, :align => :center
    end
end

