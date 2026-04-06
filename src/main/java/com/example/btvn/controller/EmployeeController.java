package com.example.btvn.controller;

import com.example.btvn.model.Employee;
import com.example.btvn.service.EmployeeService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employees")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @GetMapping
    public String list(HttpSession session, Model model) {
        if (session.getAttribute("loggedUser") == null) return "redirect:/login";

        model.addAttribute("empList", employeeService.findAll());
        model.addAttribute("techSalary", employeeService.getTotalTechSalary());
        return "employees/list";
    }

    @GetMapping("/{code}")
    public String detail(@PathVariable String code, HttpSession session, Model model) throws Exception {
        if (session.getAttribute("loggedUser") == null) return "redirect:/login";

        Employee emp = employeeService.findByCode(code);
        if (emp == null) throw new Exception("Nhân viên [" + code + "] không tồn tại trong hệ thống");

        model.addAttribute("emp", emp);
        return "employees/detail";
    }

}
