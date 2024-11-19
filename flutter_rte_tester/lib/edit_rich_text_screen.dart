import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class EditRichTextScreen extends StatefulWidget {
  const EditRichTextScreen({super.key});

  @override
  EditRichTextScreenState createState() => EditRichTextScreenState();
}

class EditRichTextScreenState extends State<EditRichTextScreen> {
  final HtmlEditorController _htmlController = HtmlEditorController();
  final appflowyEditorState = EditorState.blank();
  String _currentEditor = "SummerNote";
  Widget _buildEditor() {
    if (_currentEditor == "AppFlowy") {
      return AppFlowyEditor(
        editorState: appflowyEditorState,
      );
    } else {
      return HtmlEditor(
        controller: _htmlController, //required
        htmlEditorOptions: const HtmlEditorOptions(
          hint: "Your text here...",
          autoAdjustHeight: true,
          //initalText: "text content initial, if any",
        ),
      );
    }
  }

  @override
  void dispose() {
    _htmlController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Rich Text'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _currentEditor,
              items: const [
                DropdownMenuItem(
                    value: "AppFlowy", child: Text("AppFlowy Editor")),
                DropdownMenuItem(value: "SummerNote", child: Text("SummerNote")),
              ],
              onChanged: (value) {
                setState(() {
                  _currentEditor = value ?? "SummerNote";
                });
              },
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(16.0, 9.0))),
                padding: const EdgeInsets.all(5.0),
                child: _buildEditor(),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var out = {"summary": "", "content": "", "editor": "SummerNote"};
                if (_currentEditor == "AppFlowy") {
                  final document = appflowyEditorState.document;
                  final encoder = DocumentHTMLEncoder(encodeParsers: const [
                    HTMLBulletedListNodeParser(),
                    HTMLHeadingNodeParser(),
                    HTMLImageNodeParser(),
                    HTMLNumberedListNodeParser(),
                    HTMLQuoteNodeParser(),
                    HTMLTextNodeParser(),
                    HTMLTodoListNodeParser(),
                    HtmlTableNodeParser(),
                  ]);
                  final htmlContent = encoder.convert(document);
                  final summary = document.root.children.length;
                  out['content'] = htmlContent;
                  out['editor'] = "AppFlowy";
                  out["summary"] = "AppFlow text with $summary nodes";
                } else {
                  out['content'] = await _htmlController.getText();
                  out['editor'] = "SummerNote";
                  out["summary"] = "SummerNote Text with ${_htmlController.characterCount} characters";
                }

                if (context.mounted) {
                  Navigator.pop(context, out);
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
