import '../models/unit.dart';

class UnitConverter {
  static final List<UnitCategory> categories = [
    // Comprimento
    UnitCategory(
      name: 'Comprimento',
      units: [
        Unit(name: 'Metros', toBase: (v) => v, fromBase: (v) => v),
        Unit(name: 'Quilômetros', toBase: (v) => v * 1000, fromBase: (v) => v / 1000),
        Unit(name: 'Milhas', toBase: (v) => v * 1609.34, fromBase: (v) => v / 1609.34),
        Unit(name: 'Pés', toBase: (v) => v * 0.3048, fromBase: (v) => v / 0.3048),
        Unit(name: 'Polegadas', toBase: (v) => v * 0.0254, fromBase: (v) => v / 0.0254),
      ],
    ),
    // Peso
    UnitCategory(
      name: 'Peso',
      units: [
        Unit(name: 'Quilogramas', toBase: (v) => v, fromBase: (v) => v),
        Unit(name: 'Libras', toBase: (v) => v * 0.453592, fromBase: (v) => v / 0.453592),
        Unit(name: 'Onças', toBase: (v) => v * 0.0283495, fromBase: (v) => v / 0.0283495),
      ],
    ),
    // Temperatura
    UnitCategory(
      name: 'Temperatura',
      units: [
        Unit(name: 'Celsius', toBase: (v) => v, fromBase: (v) => v),
        Unit(name: 'Fahrenheit', toBase: (v) => (v - 32) * 5 / 9, fromBase: (v) => v * 9 / 5 + 32),
        Unit(name: 'Kelvin', toBase: (v) => v - 273.15, fromBase: (v) => v + 273.15),
      ],
    ),

    //Capacidade
    UnitCategory(
      name: 'Volume',
      units: [
        Unit(name: 'Litros', toBase: (v) => v, fromBase: (v) => v),
        Unit(name: 'Mililitros', toBase: (v) => v * 0.001, fromBase: (v) => v / 0.001),
        Unit(name: 'Galões (US)', toBase: (v) => v * 3.78541, fromBase: (v) => v / 3.78541),
        Unit(name: 'Onças fluidas (US)', toBase: (v) => v * 0.0295735, fromBase: (v) => v / 0.0295735),
      ],
    ),
    // Tempo
    UnitCategory(
      name: 'Tempo',
      units: [
        Unit(name: 'Segundos', toBase: (v) => v, fromBase: (v) => v),
        Unit(name: 'Minutos', toBase: (v) => v * 60, fromBase: (v) => v / 60),
        Unit(name: 'Horas', toBase: (v) => v * 3600, fromBase: (v) => v / 3600),
        Unit(name: 'Dias', toBase: (v) => v * 86400, fromBase: (v) => v / 86400),
      ],
    ),
  ];

  static double convert(double value, Unit fromUnit, Unit toUnit) {
    try {
      final baseValue = fromUnit.toBase(value);
      return toUnit.fromBase(baseValue);
    } catch (e) {
      throw Exception('Erro na conversão: $e');
    }
  }
}