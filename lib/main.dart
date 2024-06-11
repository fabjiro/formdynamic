import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formdynamictest/presentation/pages/form_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setPreferredOrientation();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dynamic form generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FormPage(),
    );
  }
}

/// Sets the preferred orientation of the device to portrait up.
///
/// This function uses the [SystemChrome] class to set the preferred
/// orientations of the device. It ensures that the device will always be
/// in portrait up orientation.
///
/// This function is asynchronous and returns a [Future<void>] that
/// completes when the preferred orientation is set.
Future<void> setPreferredOrientation() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
