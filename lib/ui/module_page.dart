import 'package:flutter/material.dart';

import 'done_module_list.dart';
import 'module_list.dart';

class ModulePage extends StatefulWidget {
  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  final List<String> doneModuleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Memulai Pemrograman Dengan Dart'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.done),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        // DoneModuleList(doneModuleList: doneModuleList),
                        DoneModuleList(),
                  ),
                );
              },
            ),
          ],
        ),
        body: const ModuleList()
        // ModuleList(doneModuleList: doneModuleList),
        );
  }
}
