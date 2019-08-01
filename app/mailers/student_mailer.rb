class StudentMailer < ApplicationMailer

  def send_details(students, to)
    @students = students
    @to = to
    mail( to: @to, subject: "Students details")
  end
end
