// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class QuizStruct extends FFFirebaseStruct {
  QuizStruct({
    int? quizscore,
    bool? iscorrect,
    String? selectedanswer,
    bool? quizover,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quizscore = quizscore,
        _iscorrect = iscorrect,
        _selectedanswer = selectedanswer,
        _quizover = quizover,
        super(firestoreUtilData);

  // "quizscore" field.
  int? _quizscore;
  int get quizscore => _quizscore ?? 0;
  set quizscore(int? val) => _quizscore = val;

  void incrementQuizscore(int amount) => quizscore = quizscore + amount;

  bool hasQuizscore() => _quizscore != null;

  // "iscorrect" field.
  bool? _iscorrect;
  bool get iscorrect => _iscorrect ?? false;
  set iscorrect(bool? val) => _iscorrect = val;

  bool hasIscorrect() => _iscorrect != null;

  // "selectedanswer" field.
  String? _selectedanswer;
  String get selectedanswer => _selectedanswer ?? '';
  set selectedanswer(String? val) => _selectedanswer = val;

  bool hasSelectedanswer() => _selectedanswer != null;

  // "quizover" field.
  bool? _quizover;
  bool get quizover => _quizover ?? false;
  set quizover(bool? val) => _quizover = val;

  bool hasQuizover() => _quizover != null;

  static QuizStruct fromMap(Map<String, dynamic> data) => QuizStruct(
        quizscore: castToType<int>(data['quizscore']),
        iscorrect: data['iscorrect'] as bool?,
        selectedanswer: data['selectedanswer'] as String?,
        quizover: data['quizover'] as bool?,
      );

  static QuizStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuizStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'quizscore': _quizscore,
        'iscorrect': _iscorrect,
        'selectedanswer': _selectedanswer,
        'quizover': _quizover,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quizscore': serializeParam(
          _quizscore,
          ParamType.int,
        ),
        'iscorrect': serializeParam(
          _iscorrect,
          ParamType.bool,
        ),
        'selectedanswer': serializeParam(
          _selectedanswer,
          ParamType.String,
        ),
        'quizover': serializeParam(
          _quizover,
          ParamType.bool,
        ),
      }.withoutNulls;

  static QuizStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuizStruct(
        quizscore: deserializeParam(
          data['quizscore'],
          ParamType.int,
          false,
        ),
        iscorrect: deserializeParam(
          data['iscorrect'],
          ParamType.bool,
          false,
        ),
        selectedanswer: deserializeParam(
          data['selectedanswer'],
          ParamType.String,
          false,
        ),
        quizover: deserializeParam(
          data['quizover'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'QuizStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuizStruct &&
        quizscore == other.quizscore &&
        iscorrect == other.iscorrect &&
        selectedanswer == other.selectedanswer &&
        quizover == other.quizover;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([quizscore, iscorrect, selectedanswer, quizover]);
}

QuizStruct createQuizStruct({
  int? quizscore,
  bool? iscorrect,
  String? selectedanswer,
  bool? quizover,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuizStruct(
      quizscore: quizscore,
      iscorrect: iscorrect,
      selectedanswer: selectedanswer,
      quizover: quizover,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuizStruct? updateQuizStruct(
  QuizStruct? quiz, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    quiz
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuizStructData(
  Map<String, dynamic> firestoreData,
  QuizStruct? quiz,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (quiz == null) {
    return;
  }
  if (quiz.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && quiz.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final quizData = getQuizFirestoreData(quiz, forFieldValue);
  final nestedData = quizData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = quiz.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuizFirestoreData(
  QuizStruct? quiz, [
  bool forFieldValue = false,
]) {
  if (quiz == null) {
    return {};
  }
  final firestoreData = mapToFirestore(quiz.toMap());

  // Add any Firestore field values
  quiz.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuizListFirestoreData(
  List<QuizStruct>? quizs,
) =>
    quizs?.map((e) => getQuizFirestoreData(e, true)).toList() ?? [];
