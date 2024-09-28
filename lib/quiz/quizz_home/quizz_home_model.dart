import '/flutter_flow/flutter_flow_util.dart';
import 'quizz_home_widget.dart' show QuizzHomeWidget;
import 'package:flutter/material.dart';

class QuizzHomeModel extends FlutterFlowModel<QuizzHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
