import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme/app_colors.dart';
import 'features/splash/presentation/views/splash_view.dart';

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.bgPrimary,
      ),
      home: const SplashView(),
    );
  }
}

// class BooklyApp extends StatelessWidget {
//   const BooklyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AuthCubit(
//         authRepository: AuthRepository(firebaseAuth: FirebaseAuth.instance),
//       ),
//       child: GetMaterialApp(
//         home: SplashView(),
//       ),
//     );
//   }
// }
