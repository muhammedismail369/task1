import 'package:flutter/material.dart';
import 'package:cross_scroll/cross_scroll.dart';
import 'package:collection/collection.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  TextEditingController _searchController = TextEditingController();

  final List<Map> _tests = [
    {
      'id': 100,
      'name': 'Kiran',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 101,
      'name': 'Farhath',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 102,
      'name': 'Arun',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 102,
      'name': 'Solomon',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 100,
      'name': 'Kiran',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 101,
      'name': 'Farhath',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 102,
      'name': 'Arun',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 102,
      'name': 'Solomon',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 100,
      'name': 'Kiran',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 101,
      'name': 'Farhath',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 102,
      'name': 'Arun',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 102,
      'name': 'Solomon',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 102,
      'name': 'Solomon',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 100,
      'name': 'Kiran',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 101,
      'name': 'Farhath',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 102,
      'name': 'Arun',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 102,
      'name': 'Solomon',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 100,
      'name': 'Kiran',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 101,
      'name': 'Farhath',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 102,
      'name': 'Arun',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    },
    {
      'id': 102,
      'name': 'Solomon',
      'Dateofcreation': '20/10/2023',
      'Description': 'abc'
    }
  ];
  String dropdownvalue = 'Item 1';

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  List<bool> _selected = [];
  @override
  void initState() {
    super.initState();
    _selected = List<bool>.generate(_tests.length, (int index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DataTable Demo'),
        ),
        body: Column(
          children: [
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Filter"),
                  const SizedBox(
                    width: 20,
                  ),
                  DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              child: CrossScroll(
                  verticalScroll: CrossScrollDesign(),
                  normalColor: Colors.blue,
                  hoverColor: Colors.red,
                  dimColor: Colors.red.withOpacity(0.4),
                  verticalBar: const CrossScrollBar(),
                  horizontalBar: const CrossScrollBar(),
                  child: _createDataTable()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("Add")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text("Cancel"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(label: Text('ID')),
      const DataColumn(label: Text('Name')),
      const DataColumn(label: Text('Date of creation')),
      const DataColumn(label: Text('Description'))
    ];
  }

  List<DataRow> _createRows() {
    return _tests
        .mapIndexed((index, book) => DataRow(
                cells: [
                  DataCell(Text('#${book['id']}')),
                  DataCell(Text(book['name'])),
                  DataCell(Text(book['Dateofcreation'])),
                  DataCell(Text(book['Description']))
                ],
                selected: _selected[index],
                onSelectChanged: (bool? selected) {
                  setState(() {
                    _selected[index] = selected!;
                  });
                }))
        .toList();
  }
}
