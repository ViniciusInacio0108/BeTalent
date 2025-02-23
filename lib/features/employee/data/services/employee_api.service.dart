import 'dart:convert';

import 'package:betalent/features/employee/employee.dart';
import 'package:http/http.dart' as http;

class EmployeeApiClient {
  static const _BASE_URL = String.fromEnvironment("BASE_URL");

  Future<List<EmployeeModel>> getEmployees() async {
    try {
      final response = await http.get(
        Uri.parse("$_BASE_URL/employees"),
      );
      Iterable decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
      List<EmployeeModel> employees = List<EmployeeModel>.from(
        decodedResponse.map(
          (model) => EmployeeModel.fromMap(model),
        ),
      );
      return employees;
    } catch (e) {
      return [];
    }
  }
}
