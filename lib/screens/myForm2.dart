import 'package:flutter/material.dart';
import 'package:task_1/models/data/dummy_model.dart';

class MyForm2 extends StatefulWidget {
  const MyForm2({super.key});

  @override
  State<MyForm2> createState() => _MyForm2State();
}

class _MyForm2State extends State<MyForm2> {
  List<TestCase> myTestCase = [
    TestCase(
      id: 1,
      name: 'LoginTest',
      date: DateTime.now(),
      description: 'Description 1',
    ),
    TestCase(
      id: 2,
      name: 'LogoutTest',
      date: DateTime.now(),
      description: 'Description 2',
    ),
    TestCase(
      id: 2,
      name: 'SendEmailTest',
      date: DateTime.now(),
      description: 'Description 2',
    ),
    // Add more MyModel instances as needed
  ];

  TextEditingController _searchController = TextEditingController();
  List<TestCase> _filteredModels = [];

  @override
  void initState() {
    super.initState();
    _filteredModels.addAll(myTestCase);
  }

  void _filterSearchResults(String query) {
    List<TestCase> filteredList = [];
    if (query.isNotEmpty) {
      myTestCase.forEach((model) {
        if (model.name.toLowerCase().contains(query.toLowerCase())) {
          filteredList.add(model);
        }
      });
    } else {
      filteredList.addAll(myTestCase);
    }
    setState(() {
      _filteredModels.clear();
      _filteredModels.addAll(filteredList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onChanged: _filterSearchResults,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search by name',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text('Select'),
                  ),
                  DataColumn(
                    label: Text('ID'),
                  ),
                  DataColumn(
                    label: Text('Name'),
                  ),
                  DataColumn(
                    label: Text('Date'),
                  ),
                  DataColumn(
                    label: Text('Description'),
                  ),
                ],
                rows: _filteredModels
                    .map(
                      (model) => DataRow(
                        selected: model.isSelected,
                        onSelectChanged: (isSelected) {
                          setState(() {
                            model.isSelected = isSelected!;
                          });
                        },
                        cells: [
                          DataCell(
                            Checkbox(
                              value: model.isSelected,
                              onChanged: (isSelected) {
                                setState(() {
                                  model.isSelected = isSelected!;
                                });
                              },
                            ),
                          ),
                          DataCell(
                            Text('${model.id}'),
                          ),
                          DataCell(
                            Text('${model.name}'),
                          ),
                          DataCell(
                            Text('${model.date.toLocal()}'),
                          ),
                          DataCell(
                            Text('${model.description}'),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
