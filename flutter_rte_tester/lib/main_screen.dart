import 'package:flutter/material.dart';
import 'package:flutter_rte_tester/edit_rich_text_screen.dart';
import 'package:flutter_rte_tester/view_rich_text_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final List<Map> Items = [];

  void _addItem(Map content) {
    setState(() {
      Items.add(content);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rich Text Editor Demo'),
      ),
      body: ListView.builder(
        itemCount: Items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${Items[index]['summary']}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ViewRichTextScreen(content: Items[index]['content']),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditRichTextScreen(),
            ),
          );

          if (result != null && result is Map) {
            _addItem(result);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}