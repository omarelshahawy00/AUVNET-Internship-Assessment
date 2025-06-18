import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nawel/core/di/di.dart';
import 'package:nawel/core/helpers/custom_bloc_observer.dart';
import 'package:nawel/features/home/data/models/user_model.dart';
import 'package:nawel/core/network/services/prefs.dart';
import 'package:nawel/core/routes/routes.dart';
import 'package:nawel/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register adapters
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(UserModelAdapter());
  }

  // Clear any existing cache to avoid typeId conflicts
  try {
    await Hive.deleteBoxFromDisk('user_box');
  } catch (e) {
    // Box might not exist, which is fine
  }

  await SharedPrefsService.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await getItSetup();
  Bloc.observer = CustomBlocObserver();
  runApp(const Nawel());
}

class Nawel extends StatelessWidget {
  const Nawel({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Nawel',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
