import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class MantenimientoRecord extends FirestoreRecord {
  MantenimientoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "Costo" field.
  double? _costo;
  double get costo => _costo ?? 0.0;
  bool hasCosto() => _costo != null;

  // "Vehicle" field.
  DocumentReference? _vehicle;
  DocumentReference? get vehicle => _vehicle;
  bool hasVehicle() => _vehicle != null;

  void _initializeFields() {
    _nombre = snapshotData['Nombre'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _costo = castToType<double>(snapshotData['Costo']);
    _vehicle = snapshotData['Vehicle'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Mantenimiento');

  static Stream<MantenimientoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MantenimientoRecord.fromSnapshot(s));

  static Future<MantenimientoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MantenimientoRecord.fromSnapshot(s));

  static MantenimientoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MantenimientoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MantenimientoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MantenimientoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MantenimientoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MantenimientoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMantenimientoRecordData({
  String? nombre,
  String? descripcion,
  double? costo,
  DocumentReference? vehicle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
      'Descripcion': descripcion,
      'Costo': costo,
      'Vehicle': vehicle,
    }.withoutNulls,
  );

  return firestoreData;
}

class MantenimientoRecordDocumentEquality
    implements Equality<MantenimientoRecord> {
  const MantenimientoRecordDocumentEquality();

  @override
  bool equals(MantenimientoRecord? e1, MantenimientoRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.costo == e2?.costo &&
        e1?.vehicle == e2?.vehicle;
  }

  @override
  int hash(MantenimientoRecord? e) => const ListEquality()
      .hash([e?.nombre, e?.descripcion, e?.costo, e?.vehicle]);

  @override
  bool isValidKey(Object? o) => o is MantenimientoRecord;
}
