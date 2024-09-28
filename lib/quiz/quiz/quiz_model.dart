import '/flutter_flow/flutter_flow_util.dart';
import 'quiz_widget.dart' show QuizWidget;
import 'package:flutter/material.dart';

class QuizModel extends FlutterFlowModel<QuizWidget> {
  ///  Local state fields for this page.

  bool? isCorrect;

  String? selectedanswer;

  int? quizscore = 0;

  bool isquizover = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
