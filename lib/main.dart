import 'package:flutter/material.dart';
import 'user_model.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return Material(
     title: 'flutter demo',
     theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
     ),
     home:const MyHomePage(title:'Flutter Demo Home Page'),
   );
    throw UnimplementedError();
  }

}


class MyhomePage extends StatefulWidget{
  const MyhomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState():
}

class _MyHomePageState extends State<MyhomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
    )
  }
}