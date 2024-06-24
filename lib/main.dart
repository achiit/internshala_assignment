import 'package:flutter/material.dart';
import 'package:internshala_assignment/constants/appcolors.dart';
import 'package:internshala_assignment/viewmodels/filter_VM.dart';
import 'package:internshala_assignment/viewmodels/intership_VM.dart';
import 'package:internshala_assignment/views/splash_view.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sizer/sizer.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) =>
          ResponsiveSizer(builder: (context, orientation, ScreenType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<InternshipViewModel>(
              create: (context) => InternshipViewModel(),
            ),
            ChangeNotifierProvider<FilterViewModel>(
              create: (context) => FilterViewModel(),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: router,
            title: 'MVVM with GoRouter',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blue,
              ).copyWith(secondary: AppColors.primaryColor),
            ),
          ),
        );
      }),
    );
  }
}
