import 'package:flutter/material.dart';
import 'QRs.dart';
import 'scanner.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Main'),
        ),
        backgroundColor: Colors.teal[50],
        body: Center(
          child: MainPage(),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> names = ['Lindsayca ', 'RickRoll ', 'cumbia'];
  List<String> items = [
    'C:\Users\sjgam\StudioProjects\qrcodes\lib\test.dart',
    'C:\Users\sjgam\StudioProjects\qrcodes\lib\project.dart',
    'https://www.youtube.com/watch?v=NzaK6hC0kaU&ab_channel=bavikon',
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: ElevatedButton(
            child: Text('Go', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Qrs(namess: names, qrss: items);
                  },
                ),
              );
            },
          ),
        ),

        Expanded(
          flex: 5,
          child: ElevatedButton(
              child: Text('scan', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Scan();
                  }),
                );
              }),
        ),
      ],
    );
  }
}
