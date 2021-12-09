import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReportView extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  final String reportUrl;
  ReportView(this.reportUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromRGBO(206, 147, 216, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color:  Color.fromRGBO(254, 23, 72, 1)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(95, 0,15,0),
            child: Text("Report",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromRGBO(254, 23, 72, 1)),

            ),
          ),
          elevation: 0,
          backgroundColor: Color.fromRGBO(206, 147, 216, 1),
        ),
        body: SfPdfViewer.network(
            reportUrl,
            controller: _pdfViewerController
        )
    );

  }
}
