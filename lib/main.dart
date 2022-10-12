import 'package:flutter/material.dart';
import 'package:outcaster_4/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Whatsapp App",
      //home: HomePage(),
      initialRoute: "notification_page",
        routes: {
          "/": (context) => HomePage(),
        }
    );

  }
}

