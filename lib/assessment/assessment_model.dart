import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'assessment_widget.dart' show AssessmentWidget;
import 'package:flutter/material.dart';

class AssessmentModel extends FlutterFlowModel<AssessmentWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (prediction)] action in Button widget.
  ApiCallResponse? apiResultzzs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
