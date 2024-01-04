import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/Screens/home.dart';

import 'package:shopping_app/auth/auth.dart';
import 'package:shopping_app/auth/main_auth.dart';
import 'package:shopping_app/gitit/gitit.dart';
import 'package:shopping_app/util/auth_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: (AuthManager.readAuth().isEmpty)
            ? const AuthPage()
            : const MainAuth(),
      ),
    );
  }
}
