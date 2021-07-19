require "employee"

class Startup
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        salaries.has_key?(title)
    end

    def >(startup)
        @funding > startup.funding
    end

    def hire(employee_name, title)
        raise "title does not exist" if !valid_title?(title)
        @employees << Employee.new(employee_name, title) if valid_title?(title)
    end

    def size
        @employees.length
    end

    def pay_employee(emp)
        if @funding > salaries[emp.title]
            emp.pay(salaries[emp.title]) 
            @funding -= salaries[emp.title]
 
        else
            raise
        end
    end

    def payday
        @employees.each {|ele| pay_employee(ele)}
    end

    def average_salary
        @employees.inject(0.0) { |aca, ele| aca + @salaries[ele.title] } / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        @employees += startup.employees
        startup.salaries.each do |k, v|
            @salaries[k] = v if !@salaries.has_key?(k)
        end
        startup.close()
    end
end
