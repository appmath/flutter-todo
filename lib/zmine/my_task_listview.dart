import 'package:flutter/material.dart';

class CheckBoxInListView extends StatefulWidget {
  final List<SimpleModel> list;

  CheckBoxInListView({required this.list});

  @override
  _CheckBoxInListViewState createState() => _CheckBoxInListViewState();
}

class _CheckBoxInListViewState extends State<CheckBoxInListView> {
  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.only(
            top: 40.0, bottom: 20.0, left: 20.0, right: 20.0),
        children: widget.list
            .map(
              (SimpleModel item) => CheckboxListTile(
                title: Text(
                  item.title,
                  style: TextStyle(
                      fontSize: 22.0,
                      decoration:
                          item.completed ? TextDecoration.lineThrough : null),
                ),
                value: item.checked,
                onChanged: (bool? val) {
                  setState(() => item.checked = val!);
                },
              ),
            )
            .toList(),
      );
}

class SimpleModel {
  String title;
  bool checked;
  bool completed;

  SimpleModel(
      {required this.title, required this.checked, required this.completed});
}

//  List<SimpleModel> getItemList() {
//     final List<SimpleModel> items = <SimpleModel>[
//       SimpleModel(title: 'Buy milk', checked: false, completed: false),
//       SimpleModel(title: 'Buy eggs', checked: false, completed: false),
//       SimpleModel(title: 'Buy bread', checked: false, completed: true)
//     ];
//     return items;
//   }
