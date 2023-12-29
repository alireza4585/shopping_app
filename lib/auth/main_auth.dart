// import 'package:flutter/material.dart';

// class MainAuth extends StatelessWidget {
//   const MainAuth({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Navi();
//           } else {
//             return AuthPage();
//           }
//         },
//       ),
//     );
//   }
// }
