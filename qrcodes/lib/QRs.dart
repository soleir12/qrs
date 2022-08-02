import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrs extends StatelessWidget {
  List<String> namess, qrss;
  Qrs({Key? key, required this.namess, required this.qrss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('QRs'),
        ),
        body: Container(
          alignment: AlignmentDirectional.topCenter,
          child: Column(children: <Widget>[
            for (int i = 0; i < qrss.length; i < namess.length, i++)
              QrImage(
                data: qrss[i],
                size: 100.0,
              ),
            for (int i = 0; i < namess.length; i++) Text(namess[i]),
          ]),
        ));
  }
}
