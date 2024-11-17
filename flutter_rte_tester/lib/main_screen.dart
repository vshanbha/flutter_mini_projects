import 'package:flutter/material.dart';
import 'package:flutter_rte_tester/edit_rich_text_screen.dart';
import 'package:flutter_rte_tester/view_rich_text_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> _items = [];

  void _addItem(String content) {
    setState(() {
      _items.add(content);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rich Text Editor Demo'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _items[index],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ViewRichTextScreen(content: _items[index]),
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

          if (result != null && result is String) {
            _addItem(result);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}