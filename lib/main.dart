import 'package:betalent/core/style_guide/style_guide.dart';
import 'package:betalent/features/employee/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EmployeeViewmodel(
            employeeRepo: EmployeeRepositoryJsonServer(
              jsonServerService: EmployeeApiClient(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeTalent Test',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: 'Helvetica',
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: BeTalentColors.black,
          ),
          headlineMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: BeTalentColors.black,
          ),
          headlineLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: BeTalentColors.black,
          ),
        ),
        useMaterial3: false,
      ),
      home: EmployeesListView(
        viewmodel: Provider.of<EmployeeViewmodel>(context),
      ),
    );
  }
}
