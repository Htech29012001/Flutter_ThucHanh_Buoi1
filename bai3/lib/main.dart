import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '0850070062_Nguyễn Văn Thanh Tâm'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: (click == false) ? Colors.amber : Colors.purple,
        appBar: AppBar(
          title: const Text('0850070062 Nguyễn Văn Thanh Tâm'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  click = !click;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  (click == false) ? Icons.favorite : Icons.table_chart,
                  size: 60,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}