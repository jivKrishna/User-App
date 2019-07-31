class StudentsMailer < ApplicationMailer

  def send_details
    @students = params[:users]

    mail(to: 'example@example.com', subject: "Student details")
  end
end
