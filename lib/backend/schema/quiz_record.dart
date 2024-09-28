import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizRecord extends FirestoreRecord {
  QuizRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "questionnum" field.
  int? _questionnum;
  int get questionnum => _questionnum ?? 0;
  bool hasQuestionnum() => _questionnum != null;

  // "answeroptions" field.
  List<String>? _answeroptions;
  List<String> get answeroptions => _answeroptions ?? const [];
  bool hasAnsweroptions() => _answeroptions != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _question = snapshotData['question'] as String?;
    _answer = snapshotData['answer'] as String?;
    _questionnum = castToType<int>(snapshotData['questionnum']);
    _answeroptions = getDataList(snapshotData['answeroptions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz');

  static Stream<QuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizRecord.fromSnapshot(s));

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizRecord.fromSnapshot(s));

  static QuizRecord fromSnapshot(DocumentSnapshot snapshot) => QuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizRecordData({
  String? image,
  String? question,
  String? answer,
  int? questionnum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'question': question,
      'answer': answer,
      'questionnum': questionnum,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizRecordDocumentEquality implements Equality<QuizRecord> {
  const QuizRecordDocumentEquality();

  @override
  bool equals(QuizRecord? e1, QuizRecord? e2) {
    const listEquality = ListEquality();
    return e1?.image == e2?.image &&
        e1?.question == e2?.question &&
        e1?.answer == e2?.answer &&
        e1?.questionnum == e2?.questionnum &&
        listEquality.equals(e1?.answeroptions, e2?.answeroptions);
  }

  @override
  int hash(QuizRecord? e) => const ListEquality().hash(
      [e?.image, e?.question, e?.answer, e?.questionnum, e?.answeroptions]);

  @override
  bool isValidKey(Object? o) => o is QuizRecord;
}
