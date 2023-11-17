import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.0,
      child: Stack(
        alignment: const AlignmentDirectional(0.0, 1.0),
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 39.0, 0.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).eerieBlack3,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('Home');
                        },
                        child: Icon(
                          Icons.home_sharp,
                          color: FlutterFlowTheme.of(context).sinopia,
                          size: 35.0,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('Customers');
                        },
                        child: Icon(
                          Icons.groups,
                          color: FlutterFlowTheme.of(context).sinopia,
                          size: 35.0,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.00, 1.00),
                        child: Container(
                          width: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).eerieBlack3,
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('AddAppoiment');
                        },
                        child: Icon(
                          Icons.calendar_month,
                          color: FlutterFlowTheme.of(context).sinopia,
                          size: 35.0,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('Login', context.mounted);
                        },
                        child: Icon(
                          Icons.logout,
                          color: FlutterFlowTheme.of(context).sinopia,
                          size: 35.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: 400.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    fillColor: FlutterFlowTheme.of(context).accent1,
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
