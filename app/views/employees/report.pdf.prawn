pdf = Prawn::Document.new(
  :page_size => 'A4',
  :page_layout => :portrait)
  if @employees
     pdf.text "#{@report_type} Report", :font_size => 11, :style => :bold, :align => :center
     if @report_type == "Contact"
        @employees.each do |employee|

        y_position =  pdf.cursor - 50

        pdf.bounding_box [40, y_position], :width => 300, :height => 110 do
            pdf.transparent(0.0) { pdf.stroke_bounds }
            pdf.text "Ref No : #{employee.refno}",:align => :left, :leading => 3
            pdf.text "Employee Name : #{employee.empname}",:align => :left, :leading => 3
            pdf.text "Present Address",:align => :left, :leading => 3
            pdf.text " #{employee.present_res_no} #{employee.present_res_name}",:align => :left, :leading => 3
            pdf.text " #{employee.present_street} #{employee.present_locality}",:align => :left, :leading => 3
            pdf.text " #{employee.present_city} #{employee.present_state_id}",:align => :left, :leading => 3
        end
        pdf.bounding_box [350, y_position], :width => 200, :height => 110 do
            pdf.transparent(0.0) { pdf.stroke_bounds }
            pdf.text "Email : #{employee.email}",:align => :left, :leading => 3
            pdf.text "Mobile : #{employee.mobile}",:align => :left, :leading => 3
        end

        end
     end
  end




