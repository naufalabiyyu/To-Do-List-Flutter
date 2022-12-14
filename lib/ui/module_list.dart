//* MENGGUNAKAN SM PROVIDER
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/done_module_provider.dart';

class ModuleList extends StatelessWidget {
  const ModuleList({Key? key}) : super(key: key);

  final List<String> _moduleList = const [
    'Modul 1 - Pengenalan Dart',
    'Modul 2 - Memulai Pemrograman dengan Dart',
    'Modul 3 - Dart Fundamental',
    'Modul 4 - Control Flow',
    'Modul 5 - Collections',
    'Modul 6 - Object Oriented Programming',
    'Modul 7 - Functional Styles',
    'Modul 8 - Dart Type System',
    'Modul 9 - Dart Futures',
    'Modul 10 - Effective Dart',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _moduleList.length,
      itemBuilder: (context, index) {
        return Consumer(builder: (context, DoneModuleProvider data, widget) {
          return ModuleTile(
            moduleName: _moduleList[index],
            isDone: data.doneModuleList.contains(_moduleList[index]),
            onClick: () {
              data.complete(_moduleList[index]);
            },
            onRemove: () {
              data.remove(_moduleList[index]);
            },
          );
        });
      },
    );
  }
}

//* TIDAK MENGGUNAKAN STATE MANAGEMENT PROVIDER
// class ModuleList extends StatefulWidget {
//   final List<String> doneModuleList;

//   const ModuleList({Key? key, required this.doneModuleList}) : super(key: key);

//   @override
//   State<ModuleList> createState() => _ModuleListState();
// }

// class _ModuleListState extends State<ModuleList> {
//   final List<String> _moduleList = const [
//     'Modul 1 - Pengenalan Dart',
//     'Modul 2 - Program Dart Pertamamu',
//     'Modul 3 - Dart Fundamental',
//     'Modul 4 - Control Flow',
//     'Modul 5 - Collections',
//     'Modul 6 - Object Oriented Programming',
//     'Modul 7 - Functional Styles',
//     'Modul 8 - Dart Type System',
//     'Modul 9 - Dart Futures',
//     'Modul 10 - Effective Dart',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: _moduleList.length,
//       itemBuilder: (context, index) {
//         return ModuleTile(
//           moduleName: _moduleList[index],
//           isDone: widget.doneModuleList.contains(_moduleList[index]),
//           onClick: () {
//             setState(() {
//               widget.doneModuleList.add(_moduleList[index]);
//             });
//           },
//         );
//       },
//     );
//   }
// }

class ModuleTile extends StatelessWidget {
  final String moduleName;
  final bool isDone;
  final Function() onClick;
  final Function() onRemove;

  const ModuleTile({
    Key? key,
    required this.moduleName,
    required this.isDone,
    required this.onClick,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(moduleName),
      trailing: isDone
          ? ElevatedButton(
              onPressed: onRemove,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: const Icon(Icons.done),
            )
          : ElevatedButton(
              key: Key(moduleName),
              onPressed: onClick,
              child: const Text('Done'),
            ),
    );
  }
}
