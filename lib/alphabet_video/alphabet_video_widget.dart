import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'alphabet_video_model.dart';
export 'alphabet_video_model.dart';

class AlphabetVideoWidget extends StatefulWidget {
  const AlphabetVideoWidget({
    super.key,
    required this.letter,
    required this.video,
    required this.audio,
  });

  final String? letter;
  final String? video;
  final String? audio;

  @override
  State<AlphabetVideoWidget> createState() => _AlphabetVideoWidgetState();
}

class _AlphabetVideoWidgetState extends State<AlphabetVideoWidget> {
  late AlphabetVideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlphabetVideoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'slye48rt' /* Alphabets */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Builder(
                builder: (context) {
                  if (widget.video != null && widget.video != '') {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FlutterFlowVideoPlayer(
                        path: widget.video!,
                        videoType: VideoType.network,
                        autoPlay: false,
                        looping: true,
                        showControls: true,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                    );
                  } else {
                    return Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'rbkv9rl7' /* Video Not Uploaded  */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 25.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FlutterFlowAudioPlayer(
                  audio: Audio.network(
                    widget.audio!,
                    metas: Metas(
                      title: widget.letter,
                    ),
                  ),
                  titleTextStyle:
                      FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Inter Tight',
                            letterSpacing: 0.0,
                          ),
                  playbackDurationTextStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                  fillColor: const Color(0x00000000),
                  playbackButtonColor: FlutterFlowTheme.of(context).primary,
                  activeTrackColor: FlutterFlowTheme.of(context).primary,
                  inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                  elevation: 0.0,
                  playInBackground: PlayInBackground.enabled,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '987sakjj' /* Letter */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Inter Tight',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'vs576ylm' /* : */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Inter Tight',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.letter,
                        'Number',
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Inter Tight',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
