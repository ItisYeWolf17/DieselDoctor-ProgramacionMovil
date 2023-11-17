import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CitasRecord extends FirestoreRecord {
  CitasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "Cliente" field.
  DocumentReference? _cliente;
  DocumentReference? get cliente => _cliente;
  bool hasCliente() => _cliente != null;

  // "Usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  void _initializeFields() {
    _fecha = snapshotData['Fecha'] as DateTime?;
    _cliente = snapshotData['Cliente'] as DocumentReference?;
    _usuario = snapshotData['Usuario'] as DocumentReference?;
    _descripcion = snapshotData['Descripcion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Citas');

  static Stream<CitasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitasRecord.fromSnapshot(s));

  static Future<CitasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitasRecord.fromSnapshot(s));

  static CitasRecord fromSnapshot(DocumentSnapshot snapshot) => CitasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitasRecordData({
  DateTime? fecha,
  DocumentReference? cliente,
  DocumentReference? usuario,
  String? descripcion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Fecha': fecha,
      'Cliente': cliente,
      'Usuario': usuario,
      'Descripcion': descripcion,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitasRecordDocumentEquality implements Equality<CitasRecord> {
  const CitasRecordDocumentEquality();

  @override
  bool equals(CitasRecord? e1, CitasRecord? e2) {
    return e1?.fecha == e2?.fecha &&
        e1?.cliente == e2?.cliente &&
        e1?.usuario == e2?.usuario &&
        e1?.descripcion == e2?.descripcion;
  }

  @override
  int hash(CitasRecord? e) => const ListEquality()
      .hash([e?.fecha, e?.cliente, e?.usuario, e?.descripcion]);

  @override
  bool isValidKey(Object? o) => o is CitasRecord;
}
