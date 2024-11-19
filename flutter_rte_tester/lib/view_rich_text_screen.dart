import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ViewRichTextScreen extends StatelessWidget {
  final String content;
  final GlobalKey webViewKey = GlobalKey();
  final InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: false,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: false,
      iframeAllowFullscreen: false,
      javaScriptEnabled: false);

  ViewRichTextScreen({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Rich Text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InAppWebView(
          initialSettings: settings,
          key: webViewKey,
          initialData: InAppWebViewInitialData(data: content),
        ),
      ),
    );
  }
}
