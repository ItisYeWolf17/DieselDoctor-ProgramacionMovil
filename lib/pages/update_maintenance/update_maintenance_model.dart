import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_maintenance_widget.dart' show UpdateMaintenanceWidget;
import 'package:flutter/material.dart';

class UpdateMaintenanceModel extends FlutterFlowModel<UpdateMaintenanceWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtDetalle widget.
  FocusNode? txtDetalleFocusNode;
  TextEditingController? txtDetalleController;
  String? Function(BuildContext, String?)? txtDetalleControllerValidator;
  // State field(s) for txtDescripcion widget.
  FocusNode? txtDescripcionFocusNode;
  TextEditingController? txtDescripcionController;
  String? Function(BuildContext, String?)? txtDescripcionControllerValidator;
  // State field(s) for txtCosto widget.
  FocusNode? txtCostoFocusNode;
  TextEditingController? txtCostoController;
  String? Function(BuildContext, String?)? txtCostoControllerValidator;
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txtDetalleFocusNode?.dispose();
    txtDetalleController?.dispose();

    txtDescripcionFocusNode?.dispose();
    txtDescripcionController?.dispose();

    txtCostoFocusNode?.dispose();
    txtCostoController?.dispose();

    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
