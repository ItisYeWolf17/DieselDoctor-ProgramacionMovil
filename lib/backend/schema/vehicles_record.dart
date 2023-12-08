import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class VehiclesRecord extends FirestoreRecord {
  VehiclesRecord._(
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

  // "id_cuenta" field.
  DocumentReference? _idCuenta;
  DocumentReference? get idCuenta => _idCuenta;
  bool hasIdCuenta() => _idCuenta != null;

  // "mantenimientos" field.
  List<DocumentReference>? _mantenimientos;
  List<DocumentReference> get mantenimientos => _mantenimientos ?? const [];
  bool hasMantenimientos() => _mantenimientos != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _marca = snapshotData['marca'] as String?;
    _modelo = snapshotData['modelo'] as String?;
    _year = snapshotData['year'] as String?;
    _placa = snapshotData['placa'] as String?;
    _color = snapshotData['color'] as String?;
    _imagen = snapshotData['imagen'] as String?;
    _idCuenta = snapshotData['id_cuenta'] as DocumentReference?;
    _mantenimientos = getDataList(snapshotData['mantenimientos']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Vehicles')
          : FirebaseFirestore.instance.collectionGroup('Vehicles');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Vehicles').doc();

  static Stream<VehiclesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VehiclesRecord.fromSnapshot(s));

  static Future<VehiclesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VehiclesRecord.fromSnapshot(s));

  static VehiclesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VehiclesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VehiclesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VehiclesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VehiclesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VehiclesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVehiclesRecordData({
  String? marca,
  String? modelo,
  String? year,
  String? placa,
  String? color,
  String? imagen,
  DocumentReference? idCuenta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'marca': marca,
      'modelo': modelo,
      'year': year,
      'placa': placa,
      'color': color,
      'imagen': imagen,
      'id_cuenta': idCuenta,
    }.withoutNulls,
  );

  return firestoreData;
}

class VehiclesRecordDocumentEquality implements Equality<VehiclesRecord> {
  const VehiclesRecordDocumentEquality();

  @override
  bool equals(VehiclesRecord? e1, VehiclesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.marca == e2?.marca &&
        e1?.modelo == e2?.modelo &&
        e1?.year == e2?.year &&
        e1?.placa == e2?.placa &&
        e1?.color == e2?.color &&
        e1?.imagen == e2?.imagen &&
        e1?.idCuenta == e2?.idCuenta &&
        listEquality.equals(e1?.mantenimientos, e2?.mantenimientos);
  }

  @override
  int hash(VehiclesRecord? e) => const ListEquality().hash([
        e?.marca,
        e?.modelo,
        e?.year,
        e?.placa,
        e?.color,
        e?.imagen,
        e?.idCuenta,
        e?.mantenimientos
      ]);

  @override
  bool isValidKey(Object? o) => o is VehiclesRecord;
}
