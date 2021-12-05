import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReportView extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  final String reportUrl;
  ReportView(this.reportUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Report")
        ),
        body: SfPdfViewer.network(
            reportUrl,
            controller: _pdfViewerController
        )
    );

  }
}
