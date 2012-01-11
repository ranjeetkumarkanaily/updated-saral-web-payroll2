pdf = Prawn::Document.new(
  :page_size => 'A4',
  :page_layout => :portrait)
if @report_type != "Contact"
  if @employees
    pdf.text "#{@report_type} Report", :font_size => 11, :style => :bold, :align => :center
  end
end

