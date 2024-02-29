import '/componentes/menu/menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'seleccione_reporte_widget.dart' show SeleccioneReporteWidget;
import 'package:flutter/material.dart';

class SeleccioneReporteModel extends FlutterFlowModel<SeleccioneReporteWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Menu component.
  late MenuModel menuModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    menuModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
