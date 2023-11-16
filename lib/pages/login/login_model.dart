import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  // State field(s) for passwordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldController;
  String? Function(BuildContext, String?)? passwordFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
