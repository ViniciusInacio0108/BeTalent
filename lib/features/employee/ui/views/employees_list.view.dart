import 'package:betalent/core/style_guide/style_guide.dart';
import 'package:betalent/core/components/components.dart';
import 'package:betalent/features/employee/employee.dart';
import 'package:betalent/features/employee/ui/widgets/sliver_body_employees.dart';
import 'package:flutter/material.dart';

class EmployeesListView extends StatelessWidget {
  final EmployeeViewmodel viewmodel;

  const EmployeesListView({super.key, required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeTalentColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomScrollView(
            slivers: [
              const AppBarComponent(),
              SliverBodyEmployees(viewmodel: viewmodel),
            ],
          ),
        ),
      ),
    );
  }
}
