import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for fullnameField widget.
  FocusNode? fullnameFieldFocusNode;
  TextEditingController? fullnameFieldController;
  String? Function(BuildContext, String?)? fullnameFieldControllerValidator;
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  // State field(s) for passwordFIeld widget.
  FocusNode? passwordFIeldFocusNode;
  TextEditingController? passwordFIeldController;
  String? Function(BuildContext, String?)? passwordFIeldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    fullnameFieldFocusNode?.dispose();
    fullnameFieldController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldController?.dispose();

    passwordFIeldFocusNode?.dispose();
    passwordFIeldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
