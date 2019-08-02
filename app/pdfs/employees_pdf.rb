class EmployeesPdf < Prawn::Document
  def initialize(employees)
    super()
    @employees = employees.order(:name).first(50)
    employees_table
  end

  def employees_table
    table employees_array do 
      row(0).font_style = :bold
      row(0).background_color = "063444"
      row(0).text_color = "ffffff"
      self.row_colors = ["eeeeee", "ffffff"]
      self.header = true
      cells.style(size: 10, align: :center, padding: [5, 35])
    end
  end

  def employees_array
    [["Name", "Email", "Phone Number"]] + 
    @employees.map do |employee|
      [employee.name, employee.email, employee.phone_number]
    end
  end
end

