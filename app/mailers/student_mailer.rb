class StudentMailer < ApplicationMailer

  def send_details(students)
    @students = students
    mail( to: "example@example.com", subject: "Students details")
  end
end
