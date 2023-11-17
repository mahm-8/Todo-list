import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/screen/home_page.dart';
import 'package:todo/supabase/data_base.dart';

import 'method/supa_method.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: Networking().url,
    anonKey: Networking().annonKey,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          useMaterial3: true),
      home: const HomePage()


    );
  }
}
