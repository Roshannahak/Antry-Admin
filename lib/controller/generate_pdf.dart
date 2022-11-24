import 'dart:ui';
import 'dart:html' as html;

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

Future<MemoryImage> convertWidgetToImage() async {
  final image =
      await QrPainter(data: "data", gapless: true, version: QrVersions.auto)
          .toImage(400);
  final byteArray = await image.toByteData(format: ImageByteFormat.png);
  final unit8List = byteArray!.buffer.asUint8List();
  return MemoryImage(unit8List);
}

Future<Uint8List> makePdf() async {
  final qrImage = await convertWidgetToImage();
  final pdf = Document();

  pdf.addPage(Page(
    pageFormat: PdfPageFormat.a4,
    build: (context) {
      return Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Intel Lab",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Container(height: 250, width: 250, child: Image(qrImage)),
          Text("scan me",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
          SizedBox(height: 10),
          Text("G-09",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
        ],
      ));
    },
  ));
  return await pdf.save();
}

void generateQrcodePdf() async {
  Uint8List pdfInByte = await makePdf();

  //create blob and link from byte
  /* The Blob object represents a blob,
   which is a file-like object of immutable, raw data;
   they can be read as text or binary data,
   or converted into a ReadableStream so its methods can be used for processing the data. 
  */
  final blob = html.Blob([pdfInByte], 'application/pdf');
  final url = html.Url.createObjectUrlFromBlob(blob);

  /*<A HREF="http://www.w3.org/">CERN</A>*/
  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = 'qrcode.pdf';
  html.document.body?.children.add(anchor);
  anchor.click();
}
