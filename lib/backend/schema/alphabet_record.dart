import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlphabetRecord extends FirestoreRecord {
  AlphabetRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Letter" field.
  String? _letter;
  String get letter => _letter ?? '';
  bool hasLetter() => _letter != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "wordings" field.
  String? _wordings;
  String get wordings => _wordings ?? '';
  bool hasWordings() => _wordings != null;

  void _initializeFields() {
    _letter = snapshotData['Letter'] as String?;
    _video = snapshotData['video'] as String?;
    _audio = snapshotData['audio'] as String?;
    _wordings = snapshotData['wordings'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('alphabet');

  static Stream<AlphabetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlphabetRecord.fromSnapshot(s));

  static Future<AlphabetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlphabetRecord.fromSnapshot(s));

  static AlphabetRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AlphabetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlphabetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlphabetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlphabetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlphabetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlphabetRecordData({
  String? letter,
  String? video,
  String? audio,
  String? wordings,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Letter': letter,
      'video': video,
      'audio': audio,
      'wordings': wordings,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlphabetRecordDocumentEquality implements Equality<AlphabetRecord> {
  const AlphabetRecordDocumentEquality();

  @override
  bool equals(AlphabetRecord? e1, AlphabetRecord? e2) {
    return e1?.letter == e2?.letter &&
        e1?.video == e2?.video &&
        e1?.audio == e2?.audio &&
        e1?.wordings == e2?.wordings;
  }

  @override
  int hash(AlphabetRecord? e) =>
      const ListEquality().hash([e?.letter, e?.video, e?.audio, e?.wordings]);

  @override
  bool isValidKey(Object? o) => o is AlphabetRecord;
}
