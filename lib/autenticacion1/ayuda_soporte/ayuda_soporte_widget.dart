import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'ayuda_soporte_model.dart';
export 'ayuda_soporte_model.dart';

class AyudaSoporteWidget extends StatefulWidget {
  const AyudaSoporteWidget({super.key});

  @override
  State<AyudaSoporteWidget> createState() => _AyudaSoporteWidgetState();
}

class _AyudaSoporteWidgetState extends State<AyudaSoporteWidget> {
  late AyudaSoporteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AyudaSoporteModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
    );
  }
}
