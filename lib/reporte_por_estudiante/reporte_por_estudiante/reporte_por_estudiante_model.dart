import '/componentes/menu/menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'reporte_por_estudiante_widget.dart' show ReportePorEstudianteWidget;
import 'package:flutter/material.dart';

class ReportePorEstudianteModel
    extends FlutterFlowModel<ReportePorEstudianteWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Model for Menu component.
  late MenuModel menuModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    menuModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
