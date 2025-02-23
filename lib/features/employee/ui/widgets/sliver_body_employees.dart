import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:betalent/core/style_guide/style_guide.dart';
import 'package:betalent/core/components/components.dart';
import 'package:betalent/features/employee/employee.dart';
import 'package:flutter/material.dart';

class SliverBodyEmployees extends StatefulWidget {
  final EmployeeViewmodel viewmodel;
  const SliverBodyEmployees({super.key, required this.viewmodel});

  @override
  State<SliverBodyEmployees> createState() => _SliverBodyEmployeesState();
}

class _SliverBodyEmployeesState extends State<SliverBodyEmployees> {
  late Future<void> _future;
  late TextEditingController _controller;

  @override
  void initState() {
    _future = widget.viewmodel.fetchEmployees();
    _controller = TextEditingController();

    _controller.addListener(() => widget.viewmodel.onChangeSearchParameters(_controller.text));
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(() => widget.viewmodel.onChangeSearchParameters(_controller.text));
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(
            height: 24,
          ),
          AutoSizeText(
            'Funcionários',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 15),
          SearchBarComponent(
            controller: _controller,
          ),
          const SizedBox(height: 24),
          const TableHeaderComponent(),
          ListenableBuilder(
            listenable: widget.viewmodel,
            builder: (context, _) {
              return FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: BeTalentColors.black,
                        ),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    // poderia ser algum feedback visual também
                    return Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Center(
                        child: AutoSizeText(
                          "Erro ${snapshot.error.toString()}",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: widget.viewmodel.filteredEmployees.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final employeeData = widget.viewmodel.filteredEmployees[index];
                      return TableRowComponent(employeeData: employeeData);
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
