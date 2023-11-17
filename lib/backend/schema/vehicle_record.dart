import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class VehicleRecord extends FirestoreRecord {
  VehicleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "marca" field.
  String? _marca;
  String get marca => _marca ?? '';
  bool hasMarca() => _marca != null;

  // "modelo" field.
  String? _modelo;
  String get modelo => _modelo ?? '';
  bool hasModelo() => _modelo != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "placa" field.
  String? _placa;
  String get placa => _placa ?? '';
  bool hasPlaca() => _placa != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  void _initializeFields() {
    _marca = snapshotData['marca'] as String?;
    _modelo = snapshotData['modelo'] as String?;
    _year = snapshotData['year'] as String?;
    _placa = snapshotData['placa'] as String?;
    _color = snapshotData['color'] as String?;
    _imagen = snapshotData['imagen'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vehicle');

  static Stream<VehicleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VehicleRecord.fromSnapshot(s));

  static Future<VehicleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VehicleRecord.fromSnapshot(s));

  static VehicleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VehicleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VehicleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VehicleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VehicleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VehicleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVehicleRecordData({
  String? marca,
  String? modelo,
  String? year,
  String? placa,
  String? color,
  String? imagen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'marca': marca,
      'modelo': modelo,
      'year': year,
      'placa': placa,
      'color': color,
      'imagen': imagen,
    }.withoutNulls,
  );

  return firestoreData;
}

class VehicleRecordDocumentEquality implements Equality<VehicleRecord> {
  const VehicleRecordDocumentEquality();

  @override
  bool equals(VehicleRecord? e1, VehicleRecord? e2) {
    return e1?.marca == e2?.marca &&
        e1?.modelo == e2?.modelo &&
        e1?.year == e2?.year &&
        e1?.placa == e2?.placa &&
        e1?.color == e2?.color &&
        e1?.imagen == e2?.imagen;
  }

  @override
  int hash(VehicleRecord? e) => const ListEquality()
      .hash([e?.marca, e?.modelo, e?.year, e?.placa, e?.color, e?.imagen]);

  @override
  bool isValidKey(Object? o) => o is VehicleRecord;
}
