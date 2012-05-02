require 'erb'
class UserMailer < ActionMailer::Base
  default from: "aditya.swaroop@relyonsoft.com"
  def mail_payslip(user,month)
    @user = user
    attachments.inline['logo.png'] = {:content => File.read("public/#{Company.first.photo.url(:logo)}")}
    attachments["payslip.pdf"] = File.read("#{Rails.root}/pdfs/payslip.pdf")
    @content=pay_slip_template(user,month)
    mail(:to => "#{user.empname} <#{user.email}>", :subject => "Payslip")
  end

  def pay_slip_template(user,month)
    @ch=''
    @st="Dear all\n\n   Please find the attachments"
    @dynm_con = []
    cn=File.open("#{Rails.root}/public/templates/payslip.tmp")
    while l=cn.gets
      if((s=l.scan(/##([A-Za-z_]+)##/)) !="")
        @dynm_con << s if s.length > 0
      end
    end
    values = Hash.new
    @final_value = []
    @dynm_con.each do |con|
      values["###{con[0][0]}##"] = get_empname(con,user,month)  # key value is the pattern
    end
    cn1=File.open("#{Rails.root}/public/templates/payslip.tmp")
    while l1=cn1.gets
      l1.gsub!(/##([A-Za-z_]+)##/) {
          |match|
        values[match]
      }
      temp=File.open("#{Rails.root}/public/templates/changed.txt","a") { |f| f.puts l1 }
    end
    html=File.read("#{Rails.root}/public/templates/changed.txt")
    rhtml=ERB.new(html)
    template=rhtml.result(binding)
    return template
  end

  def cleanup
    File.delete("#{Rails.root}/public/templates/changed.txt")
  end

  def get_empname(var,user,month)
    c=var[0][0]
    if(c == "empname")
      Employee.find(user.id)['empname']
    elsif(c == "companyname")
      Company.first['companyname']
    elsif(c=="month_name")
      month
    end
  end
end