package com.example.btvn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentCardController {
    @GetMapping("/student-card")
    public String getStudentCard(@RequestParam(required = false) String msv, Model model) {

        if (msv == null || msv.isEmpty()) {
            model.addAttribute("infoMessage", "Vui lòng nhập mã sinh viên để tra cứu.");
            return "student-card";
        }

        if ("SV001".equalsIgnoreCase(msv)) {
            model.addAttribute("studentName", "Nguyễn Văn An");
            model.addAttribute("faculty", "Công nghệ thông tin");
            model.addAttribute("year", 3);
            model.addAttribute("gpa", 8.5);
        } else if ("SV002".equalsIgnoreCase(msv)) {
            model.addAttribute("studentName", "Trần Thị Bình");
            model.addAttribute("faculty", "Kinh tế");
            model.addAttribute("year", 2);
            model.addAttribute("gpa", 7.2);
        } else if ("SV003".equalsIgnoreCase(msv)) {
            model.addAttribute("studentName", "Lê Minh Cường");
            model.addAttribute("faculty", "Công nghệ thông tin");
            model.addAttribute("year", 4);
            model.addAttribute("gpa", 3.8);
        } else {

            model.addAttribute("errorMessage", "Không tìm thấy sinh viên với mã " + msv);
        }

        model.addAttribute("msv", msv);

        return "student-card";
    }
}
