import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:super_editor/super_editor.dart';

class EditRichTextScreen extends StatefulWidget {
  const EditRichTextScreen({super.key});

  @override
  _EditRichTextScreenState createState() => _EditRichTextScreenState();
}

class _EditRichTextScreenState extends State<EditRichTextScreen> {
  quill.QuillController? _quillController;
  Document? _superEditorDocument;
  String _currentEditor = "Quill";

  @override
  void initState() {
    super.initState();
    _quillController = quill.QuillController.basic();
    _superEditorDocument = MutableDocument(nodes: [
      ParagraphNode(id: DocumentEditor.createNodeId(), text: AttributedText()),
    ]);
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
                DropdownMenuItem(value: "Quill", child: Text("Quill Editor")),
                DropdownMenuItem(
                    value: "HTML", child: Text("HTML Enhanced (Stub)")),
                DropdownMenuItem(
                    value: "SuperEditor", child: Text("Super Editor")),
              ],
              onChanged: (value) {
                setState(() {
                  _currentEditor = value ?? "Quill";
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
              onPressed: () {
                String content = "";

                if (_currentEditor == "Quill") {
                  content = _quillController?.document.toPlainText() ?? "";
                } else if (_currentEditor == "SuperEditor") {
                  content = _superEditorDocument?.nodes.map((node) {
                        if (node is ParagraphNode) {
                          return node.text.text;
                        }
                        return "";
                      }).join("\n") ??
                      "";
                } else {
                  content = "HTML Enhanced content (stub).";
                }

                Navigator.pop(context, content);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditor() {
    if (_currentEditor == "Quill") {
      return quill.QuillEditor.basic(
        controller: _quillController!,
//        readOnly: false,
      );
    }
/*
    else if (_currentEditor == "SuperEditor") {
      return SuperEditor(
        editor: DocumentEditor(document: _superEditorDocument!),
        documentOverlayBuilders: [],
      );
      
    }
*/
    else {
      return const Center(
        child: Text("HTML Enhanced Editor is not implemented."),
      );
    }
  }
}
