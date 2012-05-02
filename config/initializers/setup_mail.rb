ActionMailer::Base.smtp_settings = {
    :address              => "mail.relyonsoft.com",
    :port                 => 25,
    :domain               => "relyonsoft.com",
    :user_name            => "aditya.swaroop@relyonsoft.com",
    :password             => "aditya@13",
    :authentication       => "login",
    :enable_starttls_auto => false ,
    :content_type => "text/html"
}