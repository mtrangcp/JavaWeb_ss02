package com.example.btvn.service;

import com.example.btvn.model.Employee;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Service
public class EmployeeService {
    private List<Employee> employees = new ArrayList<>();

    public EmployeeService() {
        Calendar cal = Calendar.getInstance();

        cal.set(2020, Calendar.MARCH, 1);
        employees.add(new Employee("NV001", "Nguyễn Thị Lan", "Kế toán", 15000000.0, cal.getTime(), "Đang làm"));

        cal.set(2019, Calendar.JULY, 15);
        employees.add(new Employee("NV002", "Trần Văn Hùng", "Kỹ thuật", 25000000.0, cal.getTime(), "Đang làm"));

        cal.set(2021, Calendar.NOVEMBER, 20);
        employees.add(new Employee("NV003", "Lê Minh Đức", "Kinh doanh", 18500000.0, cal.getTime(), "Nghỉ phép"));

        cal.set(2022, Calendar.JANUARY, 5);
        employees.add(new Employee("NV004", "Phạm Thu Hương", "Kỹ thuật", 22000000.0, cal.getTime(), "Đang làm"));

        cal.set(2023, Calendar.JUNE, 10);
        employees.add(new Employee("NV005", "Hoàng Văn Nam", "Kế toán", 12000000.0, cal.getTime(), "Thử việc"));
    }

    public List<Employee> findAll() { return employees; }

    public Employee findByCode(String code) {
        return employees.stream().filter(e -> e.getCode().equalsIgnoreCase(code)).findFirst().orElse(null);
    }

    public double getTotalTechSalary() {
        return employees.stream()
                .filter(e -> "Kỹ thuật".equals(e.getDepartment()))
                .mapToDouble(Employee::getSalary).sum();
    }

}
