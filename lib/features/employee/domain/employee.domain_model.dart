import 'package:betalent/features/employee/employee.dart';

// model to user for the core of the app without external interference
class EmployeeDomainModel {
  String id;
  String name;
  String job;
  String admissionDate;
  String phone;
  String image;

  EmployeeDomainModel({
    required this.id,
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  factory EmployeeDomainModel.fromData(EmployeeModel dataModel) {
    // we can also add some data structuring
    return EmployeeDomainModel(
      id: dataModel.id,
      name: dataModel.name,
      job: dataModel.job,
      admissionDate: dataModel.admission_date,
      phone: dataModel.phone,
      image: dataModel.image,
    );
  }
}
