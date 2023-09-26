import 'package:flutter/material.dart';

// DataTable _createDataTable() {
//   return DataTable(columns: _createColumns(), rows: _createRows());
// }

// List<DataColumn> _createColumns() {
//   return [
//     const DataColumn(label: Text('ID')),
//     const DataColumn(label: Text('Name')),
//     const DataColumn(label: Text('Date of creation')),
//     const DataColumn(label: Text('Description'))
//   ];
// }

// List<DataRow> _createRows() {
//   return _tests
//       .mapIndexed((index, book) => DataRow(
//               cells: [
//                 DataCell(Text('#${book['id']}')),
//                 DataCell(Text(book['name'])),
//                 DataCell(Text(book['Dateofcreation'])),
//                 DataCell(Text(book['Description']))
//               ],
//               selected: _selected[index],
//               onSelectChanged: (bool? selected) {
//                 setState(() {
//                   _selected[index] = selected!;
//                 });
//               }))
//       .toList();
// }

