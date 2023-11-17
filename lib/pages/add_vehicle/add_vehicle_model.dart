import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_vehicle_widget.dart' show AddVehicleWidget;
import 'package:flutter/material.dart';

class AddVehicleModel extends FlutterFlowModel<AddVehicleWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtMarca widget.
  FocusNode? txtMarcaFocusNode;
  TextEditingController? txtMarcaController;
  String? Function(BuildContext, String?)? txtMarcaControllerValidator;
  // State field(s) for txtModelo widget.
  FocusNode? txtModeloFocusNode;
  TextEditingController? txtModeloController;
  String? Function(BuildContext, String?)? txtModeloControllerValidator;
  // State field(s) for txtyear widget.
  FocusNode? txtyearFocusNode;
  TextEditingController? txtyearController;
  String? Function(BuildContext, String?)? txtyearControllerValidator;
  // State field(s) for txtplaca widget.
  FocusNode? txtplacaFocusNode;
  TextEditingController? txtplacaController;
  String? Function(BuildContext, String?)? txtplacaControllerValidator;
  // State field(s) for txtcolor widget.
  FocusNode? txtcolorFocusNode;
  TextEditingController? txtcolorController;
  String? Function(BuildContext, String?)? txtcolorControllerValidator;
  // State field(s) for txturlimagen widget.
  FocusNode? txturlimagenFocusNode;
  TextEditingController? txturlimagenController;
  String? Function(BuildContext, String?)? txturlimagenControllerValidator;
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
    txtMarcaFocusNode?.dispose();
    txtMarcaController?.dispose();

    txtModeloFocusNode?.dispose();
    txtModeloController?.dispose();

    txtyearFocusNode?.dispose();
    txtyearController?.dispose();

    txtplacaFocusNode?.dispose();
    txtplacaController?.dispose();

    txtcolorFocusNode?.dispose();
    txtcolorController?.dispose();

    txturlimagenFocusNode?.dispose();
    txturlimagenController?.dispose();

    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
