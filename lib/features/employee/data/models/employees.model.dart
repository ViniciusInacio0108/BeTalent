import 'dart:convert';

// Model based on the api structure
class EmployeeModel {
  String id;
  String name;
  String job;
  String admission_date;
  String phone;
  String image;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.job,
    required this.admission_date,
    required this.phone,
    required this.image,
  });

  EmployeeModel copyWith({
    String? id,
    String? name,
    String? job,
    String? admission_date,
    String? phone,
    String? image,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      job: job ?? this.job,
      admission_date: admission_date ?? this.admission_date,
      phone: phone ?? this.phone,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'job': job,
      'admission_date': admission_date,
      'phone': phone,
      'image': image,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'] as String,
      name: map['name'] as String,
      job: map['job'] as String,
      admission_date: map['admission_date'] as String,
      phone: map['phone'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) => EmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmployeeModel(id: $id, name: $name, job: $job, admission_date: $admission_date, phone: $phone, image: $image)';
  }

  @override
  bool operator ==(covariant EmployeeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.job == job &&
        other.admission_date == admission_date &&
        other.phone == phone &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ job.hashCode ^ admission_date.hashCode ^ phone.hashCode ^ image.hashCode;
  }
}
