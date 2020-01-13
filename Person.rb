class Person
  attr_accessor :name ,:age ,:contact_number
  @@PersonCount = 0
  
  def get_personal_details()
    @@PersonCount += 1
    print "\tName :"
    @name = gets.chomp
    
    print "\tage:"
    @age = gets.chomp.to_i
  end
  
  def show()
    puts "\n\t 1.Name : #{@name}\n\t 2.Age : #{@age}"
  end

  def edit_personal_details
    print "\n\tEnter new name : "
    @name = gets.chomp

    print "\n\tEnter new age : "
    @age = gets.chomp.to_i
  end

end

class Employee < Person
  attr_accessor :salary , :designation
  
  def get_employee_details
    print "\tSalary : "
    @salary = gets.chomp.to_i
    print "\tDesignation : "
    @designation = gets.chomp
    puts "\temployye Details #{@salary} ,#{@designation}"
  end
  
  def show()
    puts "\n  Your Data Saved Successfully as below :-"
    puts "\n\t 1.Name : #{@name}\n\t 2.Age : #{@age}"   
    puts "\t 3.Salary : #{@salary}\n\t 4.Designation : #{@designation}"
  end

  def edit_employee_details
    print "\n\tEnter #{@name}'s new salary :  "
    @salary = gets.chomp.to_i

    print "\tEnter #{@name}'s new designation :  "
    @designation = gets.chomp
  end

  
end

class Customer < Person
  attr_accessor :product_name 

  def initialize ()
    # super invokes same name parent mtd
    @@PersonCount += 1
    puts "\tcount : #{@@PersonCount}"
  end
  
  def show()
    puts "\n  Your Data Saved Successfully as below :-"
    puts "\n\t 1.Name : #{@name}\n\t 2.Age : #{@age}"
    puts "\t 3.product_name : #{@product_name}\n\n"
  end

  def get_customer_details
    print "\tproduct_name : "
    @product_name = gets.chomp

    #print "\t : "
    #@product_name = gets.chomp
    #:wq
    #puts "\tCustomer Details #{@product_name}"
  end


  def edit_customer_details
    print "Enter #{@name}'s new product name :  "
    @product_name = gets.chomp
  end

end

class Admin < Person
  attr_accessor :role , :passkey
  
  def get_admin_details
    print "\n\t\tRole : "
    @role = gets.chomp
    print "\n\t\tPassword : "
    @passkey = gets.chomp.to_i
  end
  def show()
    puts "\n  Your Data Saved Successfully as below :-"
    puts "\n\t 1.Name : #{@name}\n\t 2.Age : #{@age}"
    puts "\t 3.Role : #{@role}\n\t 4.Password : #{@passkey}"
  end
  def edit_admin_details  
    print "\n\tEnter #{@name}'s new role :  "
    @role = gets.chomp
    print "\tEnter #{@name}'s new password :  "
    @passkey = gets.chomp.to_i
  end
end


continue = true
while continue
  puts "\n\t\twho are you \n\t\t 1.Employee \n\t\t 2.Customer \n\t\t 3.Admin"
  print "\n\t\t\tEnter Choice : "
  
  choice = gets.chomp.to_i
  case choice
  when 1
    employee = Employee.new()
    employee.get_personal_details()
    employee.get_employee_details()
    employee.show()

    print "\n\t\t Want to Edit Details(y/n)"
    edit = gets.chomp
    if edit == "y" 
      employee.edit_personal_details()
      employee.edit_employee_details()
    end

    puts "\n\t Details Updated Successfully\n"
    employee.show()

  when 2 
    customer = Customer.new()
    customer.get_personal_details()
    customer.get_customer_details()
    customer.show()

    print "\n\t\t Want to Edit Details(y/n)"
    edit = gets.chomp
    if edit == "y"
      customer.edit_personal_details()
      customer.edit_customer_details()
    end
    puts "\n\t Details Updated Successfully\n"
    customer.show()

  when 3
    admin = Admin.new()
    admin.get_personal_details()
    admin.get_admin_details
    admin.show()
    print "\n\t\t Want to Edit Details(y/n)"
    edit = gets.chomp
    if edit == "y"
       admin.edit_personal_details()
       admin.edit_admin_details()
    end
    puts "\n\t Details Updated Successfully\n"
    admin.show()
  end
  
  #Person.show_details()
  print "\n\n\twant to continue ???(y/n)  "
  c = gets.chomp
  if c == "n" 
    continue = false
  end
end

