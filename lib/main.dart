import 'package:datainfoapp/providers/dataInfo_provider.dart';

import 'package:datainfoapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) {
          return DataInfoProvider();
        }))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Kanit',
        ),
        home: const HomeScreen(),
      ),
    );
  }
}


