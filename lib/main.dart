import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'storage_service.dart';
import 'package:flutter/gestures.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attach file',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'attach files'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const url =
        'https://console.firebase.google.com/u/0/project/project-29bf7/storage/project-29bf7.appspot.com/files/~2Ftest';
    void launchURL() async => await canLaunch(url)
        ? await launch(url)
        : throw 'Could not launch $url';
    final Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Please attach files',
            ),
            ElevatedButton(
              child: Text('pick file'),
              onPressed: () async {
                final results = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['png', 'jpg'],
                );
                if (results == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('no file picked'),
                    ),
                  );
                  return null;
                }
                final path = results.files.single.path!;
                final fileName = results.files.single.name;
                storage.uploadFile(path, fileName);
                
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('hello'),
                          content: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "To access this Image click this link here",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {})
                            ]),
                          ),
                          actions: [
                            TextButton(
                              child: Text('ok'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ));
              },
            )
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
