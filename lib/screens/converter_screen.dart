import 'package:flutter/material.dart';
import '../models/unit.dart';
import '../utils/converter.dart';

class ConverterScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final _valueController = TextEditingController();
  String _currentCategory = 'Comprimento';
  Unit? _fromUnit;
  Unit? _toUnit;
  String _result = '';

  @override
  void initState() {
    super.initState();
    _updateUnits();
  }

  void _updateUnits() {
    final category = UnitConverter.categories.firstWhere((c) => c.name == _currentCategory);
    setState(() {
      _fromUnit = category.units[0];
      _toUnit = category.units[1];
      _valueController.clear();
      _result = '';
    });
  }

  void _convert() {
    double value = double.tryParse(_valueController.text) ?? 0;
    if (_fromUnit != null && _toUnit != null) {
      double result = UnitConverter.convert(value, _fromUnit!, _toUnit!);
      setState(() {
        _result = result.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentCategory = UnitConverter.categories.firstWhere((c) => c.name == _currentCategory);

    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter - $_currentCategory'),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFF212121),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFD32F2F),
                ),
                child: Text(
                  'Conversores',
                  style: TextStyle(
                    color: Color(0xFFF5F5F5),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ...UnitConverter.categories.map((category) => ListTile(
                    title: Text(
                      category.name,
                      style: TextStyle(color: Color(0xFFF5F5F5)),
                    ),
                    onTap: () {
                      setState(() {
                        _currentCategory = category.name;
                        _updateUnits();
                      });
                      Navigator.pop(context);
                    },
                  )),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _valueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor',
              ),
              style: TextStyle(color: Color(0xFFF5F5F5)),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<Unit>(
                    value: _fromUnit,
                    items: currentCategory.units
                        .map((unit) => DropdownMenuItem(
                              value: unit,
                              child: Text(unit.name),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => _fromUnit = value),
                    dropdownColor: Color(0xFF424242),
                    style: TextStyle(color: Color(0xFFF5F5F5)),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<Unit>(
                    value: _toUnit,
                    items: currentCategory.units
                        .map((unit) => DropdownMenuItem(
                              value: unit,
                              child: Text(unit.name),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => _toUnit = value),
                    dropdownColor: Color(0xFF424242),
                    style: TextStyle(color: Color(0xFFF5F5F5)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Converter'),
            ),
            SizedBox(height: 20),
            if (_result.isNotEmpty)
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF424242),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Resultado: $_result ${_toUnit!.name}',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}