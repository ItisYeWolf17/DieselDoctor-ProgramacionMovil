import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_appoiment_widget.dart' show AddAppoimentWidget;
import 'package:flutter/material.dart';

class AddAppoimentModel extends FlutterFlowModel<AddAppoimentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for txtdescription widget.
  FocusNode? txtdescriptionFocusNode;
  TextEditingController? txtdescriptionController;
  String? Function(BuildContext, String?)? txtdescriptionControllerValidator;
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
    txtdescriptionFocusNode?.dispose();
    txtdescriptionController?.dispose();

    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
