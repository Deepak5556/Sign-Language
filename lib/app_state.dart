import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _makePhoto = true;
  bool get makePhoto => _makePhoto;
  set makePhoto(bool value) {
    _makePhoto = value;
  }

  String _fileBase64 = '';
  String get fileBase64 => _fileBase64;
  set fileBase64(String value) {
    _fileBase64 = value;
  }

  List<QuizQuestionStruct> _quizQuestions = [
    QuizQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question_text\":\"What Is You See In This Picture?\",\"options\":\"[\\\"D\\\",\\\"F\\\",\\\"C\\\",\\\"A\\\"]\",\"correct_answer\":\"3\",\"image\":\"https://alphanumericimages.s3.eu-north-1.amazonaws.com/alphanumeric/A.jpg\"}')),
    QuizQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question_text\":\"What Do You See In This Picture?\",\"options\":\"[\\\"S\\\",\\\"C\\\",\\\"J\\\",\\\"F\\\"]\",\"correct_answer\":\"1\",\"image\":\"https://alphanumericimages.s3.eu-north-1.amazonaws.com/alphanumeric/C.jpg\"}')),
    QuizQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question_text\":\"What Do You See In This Picture?\",\"options\":\"[\\\"E\\\",\\\"L\\\",\\\"K\\\",\\\"X\\\"]\",\"correct_answer\":\"0\",\"image\":\"https://alphanumericimages.s3.eu-north-1.amazonaws.com/alphanumeric/E.jpg\"}')),
    QuizQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question_text\":\"What Do You See In This Picture?\",\"options\":\"[\\\"M\\\",\\\"F\\\",\\\"Y\\\",\\\"I\\\"]\",\"correct_answer\":\"2\",\"image\":\"https://alphanumericimages.s3.eu-north-1.amazonaws.com/alphanumeric/Y.jpg\"}')),
    QuizQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question_text\":\"What Do You See In This Picture?\",\"options\":\"[\\\"Q\\\",\\\"J\\\",\\\"Z\\\",\\\"O\\\"]\",\"correct_answer\":\"0\",\"image\":\"https://alphanumericimages.s3.eu-north-1.amazonaws.com/alphanumeric/Q.jpg\"}')),
    QuizQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question_text\":\"What Do You See In This Picture?\",\"options\":\"[\\\"B\\\",\\\"D\\\",\\\"R\\\",\\\"T\\\"]\",\"correct_answer\":\"2\",\"image\":\"https://alphanumericimages.s3.eu-north-1.amazonaws.com/alphanumeric/R.jpg\"}')),
    QuizQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question_text\":\"What Do You See In This Picture?\",\"options\":\"[\\\"L\\\",\\\"S\\\",\\\"A\\\",\\\"v\\\"]\",\"correct_answer\":\"3\",\"image\":\"https://alphanumericimages.s3.eu-north-1.amazonaws.com/alphanumeric/V.jpg\"}')),
    QuizQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question_text\":\"What Do You See In This Picture?\",\"options\":\"[\\\"W\\\",\\\"U\\\",\\\"E\\\",\\\"Q\\\"]\",\"correct_answer\":\"1\",\"image\":\"https://alphanumericimages.s3.eu-north-1.amazonaws.com/alphanumeric/U.jpg\"}')),
    QuizQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question_text\":\"What Do You See In This Picture?\",\"options\":\"[\\\"D\\\",\\\"S\\\",\\\"J\\\",\\\"N\\\"]\",\"correct_answer\":\"0\",\"image\":\"https://alphanumericimages.s3.eu-north-1.amazonaws.com/alphanumeric/D.jpg\"}')),
    QuizQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question_text\":\"What Do You See In This Picture?\",\"options\":\"[\\\"K\\\",\\\"A\\\",\\\"H\\\",\\\"L\\\"]\",\"correct_answer\":\"2\",\"image\":\"https://alphanumericimages.s3.eu-north-1.amazonaws.com/alphanumeric/H.jpg\"}'))
  ];
  List<QuizQuestionStruct> get quizQuestions => _quizQuestions;
  set quizQuestions(List<QuizQuestionStruct> value) {
    _quizQuestions = value;
  }

  void addToQuizQuestions(QuizQuestionStruct value) {
    quizQuestions.add(value);
  }

  void removeFromQuizQuestions(QuizQuestionStruct value) {
    quizQuestions.remove(value);
  }

  void removeAtIndexFromQuizQuestions(int index) {
    quizQuestions.removeAt(index);
  }

  void updateQuizQuestionsAtIndex(
    int index,
    QuizQuestionStruct Function(QuizQuestionStruct) updateFn,
  ) {
    quizQuestions[index] = updateFn(_quizQuestions[index]);
  }

  void insertAtIndexInQuizQuestions(int index, QuizQuestionStruct value) {
    quizQuestions.insert(index, value);
  }
}
