import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  void initState(BuildContext context) {}

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
