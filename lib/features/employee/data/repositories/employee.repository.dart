import 'package:betalent/features/employee/employee.dart';

abstract class EmployeeRepository {
  Future<List<EmployeeDomainModel>> getEmployees();
}
