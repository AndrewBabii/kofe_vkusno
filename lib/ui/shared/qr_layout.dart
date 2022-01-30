import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofe_vkusno/global/const/qr_code_string.dart';
import 'package:kofe_vkusno/providers.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRLayout extends ConsumerStatefulWidget {
  const QRLayout({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QRLayoutState();
}

class _QRLayoutState extends ConsumerState<QRLayout>{
  QRViewController? qrController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    }
    qrController!.resumeCamera();
  }

  @override
  void dispose() {
    qrController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scanArea = MediaQuery.of(context).size.width / 2;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: const Color(0xFFFFF7e5),
          borderRadius: 1,
          borderLength: 10,
          borderWidth: 5,
          cutOutSize: scanArea
      ),
    );
  }

  void _onQRViewCreated(QRViewController qrController) {
    setState(() {
      this.qrController = qrController;
    });

    qrController.scannedDataStream.firstWhere((scanData) => scanData.code!.compareTo(rightQrCode) == 0)
        .whenComplete(() {
      ref.watch(cupProvider.notifier).addOneCup();
      Navigator.of(context).popAndPushNamed('/cup');
    });

  }


}
