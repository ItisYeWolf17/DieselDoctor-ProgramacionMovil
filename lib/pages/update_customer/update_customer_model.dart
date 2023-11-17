import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_customer_widget.dart' show UpdateCustomerWidget;
import 'package:flutter/material.dart';

class UpdateCustomerModel extends FlutterFlowModel<UpdateCustomerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for lastnameField widget.
  FocusNode? lastnameFieldFocusNode;
  TextEditingController? lastnameFieldController;
  String? Function(BuildContext, String?)? lastnameFieldControllerValidator;
  // State field(s) for idField widget.
  FocusNode? idFieldFocusNode;
  TextEditingController? idFieldController;
  String? Function(BuildContext, String?)? idFieldControllerValidator;
  // State field(s) for phoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldController;
  String? Function(BuildContext, String?)? phoneFieldControllerValidator;
  // State field(s) for emailFIeld widget.
  FocusNode? emailFIeldFocusNode;
  TextEditingController? emailFIeldController;
  String? Function(BuildContext, String?)? emailFIeldControllerValidator;
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
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    lastnameFieldFocusNode?.dispose();
    lastnameFieldController?.dispose();

    idFieldFocusNode?.dispose();
    idFieldController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldController?.dispose();

    emailFIeldFocusNode?.dispose();
    emailFIeldController?.dispose();

    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
