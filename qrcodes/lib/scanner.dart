import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/foundation.dart';
import 'test.dart';
import 'project.dart';
class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (kIsWeb) {
      controller!.pauseCamera();
    } else {
      controller!.pauseCamera();
    }
  }
Widget buildResult()=> Text(
  'Scan a code!',
  maxLines: 3,
);
  Widget build(BuildContext context) {
    return SafeArea( child:
      Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                borderColor: Theme.of(context).accentColor,
                  cutOutSize: MediaQuery.of(context).size.width * .8),
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ?  pageSender(
                  '${result!.code}')
                  : Text('Scan a code'),
            ),


          ),

        ],
      ),
    ),
    );
  }
pageSender( String result){
    switch (result) {
    case ('C:\Users\sjgam\StudioProjects\qrcodes\lib\test.dart'):
      return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Test()));
    case ('C:\Users\sjgam\StudioProjects\qrcodes\lib\project.dart'):
      return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Project()));
  }
}

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
