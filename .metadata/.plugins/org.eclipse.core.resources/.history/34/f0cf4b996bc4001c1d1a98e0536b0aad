package com.jerrymvc.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jerrymvc.springdemo.model.Employee;
import com.jerrymvc.springdemo.service.EmployeeService;

@Controller
@RequestMapping("employee")
public class EmployeeController {

	@Autowired
	private EmployeeService empService;

	@GetMapping("/add")
	public String addEmployeePage(Model model) {

		model.addAttribute("employeeBean", new Employee());

		return "employee/addPage";
	}

	@PostMapping("/add")
	public String postEmployee(@ModelAttribute("employeeBean") Employee postEmp) {
		empService.addEmployee(postEmp);

		return "employee/addFinishPage";
	}

	@GetMapping("list")
	public String listEmployee(Model model) {
		List<Employee> allEmployee = empService.getAllEmployee();

		model.addAttribute("employeeList", allEmployee);
		return "employee/listEmployee";

	}

}