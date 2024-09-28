// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizQuestionStruct extends FFFirebaseStruct {
  QuizQuestionStruct({
    String? questionText,
    List<String>? options,
    int? correctAnswer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _questionText = questionText,
        _options = options,
        _correctAnswer = correctAnswer,
        super(firestoreUtilData);

  // "question_text" field.
  String? _questionText;
  String get questionText => _questionText ?? '';
  set questionText(String? val) => _questionText = val;

  bool hasQuestionText() => _questionText != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;

  void updateOptions(Function(List<String>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  // "correct_answer" field.
  int? _correctAnswer;
  int get correctAnswer => _correctAnswer ?? 0;
  set correctAnswer(int? val) => _correctAnswer = val;

  void incrementCorrectAnswer(int amount) =>
      correctAnswer = correctAnswer + amount;

  bool hasCorrectAnswer() => _correctAnswer != null;

  static QuizQuestionStruct fromMap(Map<String, dynamic> data) =>
      QuizQuestionStruct(
        questionText: data['question_text'] as String?,
        options: getDataList(data['options']),
        correctAnswer: castToType<int>(data['correct_answer']),
      );

  static QuizQuestionStruct? maybeFromMap(dynamic data) => data is Map
      ? QuizQuestionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question_text': _questionText,
        'options': _options,
        'correct_answer': _correctAnswer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question_text': serializeParam(
          _questionText,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          isList: true,
        ),
        'correct_answer': serializeParam(
          _correctAnswer,
          ParamType.int,
        ),
      }.withoutNulls;

  static QuizQuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuizQuestionStruct(
        questionText: deserializeParam(
          data['question_text'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        correctAnswer: deserializeParam(
          data['correct_answer'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'QuizQuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuizQuestionStruct &&
        questionText == other.questionText &&
        listEquality.equals(options, other.options) &&
        correctAnswer == other.correctAnswer;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([questionText, options, correctAnswer]);
}

QuizQuestionStruct createQuizQuestionStruct({
  String? questionText,
  int? correctAnswer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuizQuestionStruct(
      questionText: questionText,
      correctAnswer: correctAnswer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuizQuestionStruct? updateQuizQuestionStruct(
  QuizQuestionStruct? quizQuestion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    quizQuestion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuizQuestionStructData(
  Map<String, dynamic> firestoreData,
  QuizQuestionStruct? quizQuestion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (quizQuestion == null) {
    return;
  }
  if (quizQuestion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && quizQuestion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final quizQuestionData =
      getQuizQuestionFirestoreData(quizQuestion, forFieldValue);
  final nestedData =
      quizQuestionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = quizQuestion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuizQuestionFirestoreData(
  QuizQuestionStruct? quizQuestion, [
  bool forFieldValue = false,
]) {
  if (quizQuestion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(quizQuestion.toMap());

  // Add any Firestore field values
  quizQuestion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuizQuestionListFirestoreData(
  List<QuizQuestionStruct>? quizQuestions,
) =>
    quizQuestions?.map((e) => getQuizQuestionFirestoreData(e, true)).toList() ??
    [];
