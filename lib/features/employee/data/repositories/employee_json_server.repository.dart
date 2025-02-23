import 'package:betalent/features/employee/employee.dart';

class EmployeeRepositoryJsonServer implements EmployeeRepository {
  final EmployeeApiClient jsonServerService;
  EmployeeRepositoryJsonServer({required this.jsonServerService});

  @override
  Future<List<EmployeeDomainModel>> getEmployees() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await jsonServerService.getEmployees();

    return response.map((employee) => EmployeeDomainModel.fromData(employee)).toList();
  }
}
