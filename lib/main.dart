import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_project/authentication/screen/authentication_view.dart';
import 'package:firestore_project/modules/admin_module/screens/dashboard_view.dart';
import 'package:firestore_project/modules/user_module/screens/user_dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyDuzrzbQ2X73SmrDB20Qdw_-uFO6hHGcbY',
      appId: '1:860289134092:android:705401d4a6ce38e8e6c829',
      messagingSenderId: '860289134092',
      projectId: 'firestoreproject-54b9b',
      storageBucket: 'firestoreproject-54b9b.appspot.com',
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                print("hereeeee${snapshot.data?.email}");
                if (snapshot.data?.email == "user@gmail.com") {
                  print("hereeeee");
                  return const UserDashboardView();
                } else {
                  print("here 2");
                  return const AdminDashboardView();
                }
              } else {
                return AuthenticationView();
              }
            },
          ),
        );
      },
    );
  }
}
