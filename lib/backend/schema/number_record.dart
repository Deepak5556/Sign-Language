import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NumberRecord extends FirestoreRecord {
  NumberRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  // "Video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "Audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "wordings" field.
  String? _wordings;
  String get wordings => _wordings ?? '';
  bool hasWordings() => _wordings != null;

  void _initializeFields() {
    _number = castToType<int>(snapshotData['Number']);
    _video = snapshotData['Video'] as String?;
    _audio = snapshotData['Audio'] as String?;
    _wordings = snapshotData['wordings'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('number');

  static Stream<NumberRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NumberRecord.fromSnapshot(s));

  static Future<NumberRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NumberRecord.fromSnapshot(s));

  static NumberRecord fromSnapshot(DocumentSnapshot snapshot) => NumberRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NumberRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NumberRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NumberRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NumberRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNumberRecordData({
  int? number,
  String? video,
  String? audio,
  String? wordings,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Number': number,
      'Video': video,
      'Audio': audio,
      'wordings': wordings,
    }.withoutNulls,
  );

  return firestoreData;
}

class NumberRecordDocumentEquality implements Equality<NumberRecord> {
  const NumberRecordDocumentEquality();

  @override
  bool equals(NumberRecord? e1, NumberRecord? e2) {
    return e1?.number == e2?.number &&
        e1?.video == e2?.video &&
        e1?.audio == e2?.audio &&
        e1?.wordings == e2?.wordings;
  }

  @override
  int hash(NumberRecord? e) =>
      const ListEquality().hash([e?.number, e?.video, e?.audio, e?.wordings]);

  @override
  bool isValidKey(Object? o) => o is NumberRecord;
}
