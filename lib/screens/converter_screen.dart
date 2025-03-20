// lib/screens/converter_screen.dart
import 'package:flutter/material.dart';
import '../models/unit.dart' as models;  
import '../utils/converter.dart' as utils;  



class ConverterScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  String selectedCategory = 'Comprimento';
  models.Unit? fromUnit;
  models.Unit? toUnit;
  double inputValue = 0.0;
  double result = 0.0;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updateUnits();
  }

  void _updateUnits() {
    final category = utils.UnitConverter.categories.firstWhere(
      
      (cat) => cat.name == selectedCategory,
    );
    setState(() {
      fromUnit = category.units[0];
      toUnit = category.units[1];
    });
  }

  void _convert() {
    if (fromUnit != null && toUnit != null) {
      try {
        setState(() {
          result = utils.UnitConverter.convert(inputValue, fromUnit!, toUnit!);
        });
      } catch (e) {
        ScaffoldMessenger.of(
          
          context,
        ).showSnackBar(SnackBar(content: Text('Erro: Entrada inválida')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final category = utils.UnitConverter.categories.firstWhere(
      
      (cat) => cat.name == selectedCategory,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Unit Converter')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedCategory,
              isExpanded: true,
              items:
                 
                  utils.UnitConverter.categories
                          .map(
                        
                        (cat) => DropdownMenuItem(
                            value: cat.name,
                            child: Text(cat.name),
                          ),
                      )
                          .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                  _updateUnits();
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<models.Unit>(
                    value: fromUnit,
                    isExpanded: true,
                    items:
                       
                        category.units
                                .map(
                              
                              (unit) => DropdownMenuItem(
                                  value: unit,
                                  child: Text(unit.name),
                                ),
                            )
                                .toList(),
                    onChanged: (value) => setState(() => fromUnit = value),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<models.Unit>(
                    value: toUnit,
                    isExpanded: true,
                    items:
                       
                        category.units
                                .map(
                              
                              (unit) => DropdownMenuItem(
                                  value: unit,
                                  child: Text(unit.name),
                                ),
                            )
                                .toList(),
                    onChanged: (value) => setState(() => toUnit = value),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Converter'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Resultado: ${result.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
