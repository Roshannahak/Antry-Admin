import 'dart:ui';
import 'dart:html' as html;

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../model/roomlist_model.dart';

Future<MemoryImage> convertWidgetToImage(String roomId) async {
  final image =
      await QrPainter(data: roomId, gapless: true, version: QrVersions.auto)
          .toImage(300);
  final byteArray = await image.toByteData(format: ImageByteFormat.png);
  final unit8List = byteArray!.buffer.asUint8List();
  return MemoryImage(unit8List);
}

Future<Uint8List> makePdf(Room room) async {
  final qrImage = await convertWidgetToImage(room.id!);
  final pdf = Document();

  pdf.addPage(Page(
    pageFormat: PdfPageFormat.a4,
    build: (context) {
      return Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(room.roomname!,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Container(height: 250, width: 250, child: Image(qrImage)),
          Text("scan me",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
          SizedBox(height: 10),
          Text(room.roomno!,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
        ],
      ));
    },
  ));
  return await pdf.save();
}

void generateQrcodePdf({required Room room}) async {
  Uint8List pdfInByte = await makePdf(room);

  //create blob and link from byte
  /* The Blob object represents a blob,
   which is a file-like object of immutable, raw data;
   they can be read as text or binary data,
   or converted into a ReadableStream so its methods can be used for processing the data. 
  */
  final blob = html.Blob([pdfInByte], 'application/pdf');
  final url = html.Url.createObjectUrlFromBlob(blob);

  String fileName = "${room.roomno}_print_file.pdf";

  /*<A HREF="http://www.w3.org/">CERN</A>*/
  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = fileName;
  html.document.body?.children.add(anchor);
  anchor.click();
}
