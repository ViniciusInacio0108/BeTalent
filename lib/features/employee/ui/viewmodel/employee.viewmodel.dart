import 'dart:async';

import 'package:betalent/features/employee/employee.dart';
import 'package:flutter/material.dart';

class EmployeeViewmodel extends ChangeNotifier {
  final EmployeeRepository employeeRepo;

  EmployeeViewmodel({required this.employeeRepo});

  List<EmployeeDomainModel> _employees = [];
  List<EmployeeDomainModel> get employees => _employees;

  List<EmployeeDomainModel> _filteredEmployees = [];
  List<EmployeeDomainModel> get filteredEmployees => _filteredEmployees;

  Future<void> fetchEmployees() async {
    _employees = await employeeRepo.getEmployees();
    _filteredEmployees = _employees;
    notifyListeners();
  }

  void onChangeSearchParameters(String value) {
    final lowervalue = value.toLowerCase().trim();

    _filteredEmployees = _employees
        .where(
          (employee) =>
              employee.name.toLowerCase().trim().contains(lowervalue) ||
              employee.phone.toLowerCase().trim().contains(lowervalue) ||
              employee.job.toLowerCase().trim().contains(lowervalue),
        )
        .toList();

    notifyListeners();
  }
}
