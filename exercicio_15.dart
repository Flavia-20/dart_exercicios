 import 'dart:io';

void main() {
  List<Map<String, dynamic>> bois = [
    {'numero': 1, 'peso': 320.0},
    {'numero': 2, 'peso': 475.0},
    {'numero': 3, 'peso': 210.0},
    {'numero': 4, 'peso': 390.0},
    {'numero': 5, 'peso': 530.0},
    {'numero': 6, 'peso': 285.0},
    {'numero': 7, 'peso': 410.0},
  ];

  print('=== Sistema de Pesquisa de Bois ===\n');
  print('Bois cadastrados: ${bois.length}');

  while (true) {
    print('\nDigite o peso mínimo (0 para sair):');
    double? min = double.tryParse(stdin.readLineSync()!);
    if (min == null) {
      print('Valor inválido.');
      continue;
    }
    if (min == 0) break;

    double? max;
    while (max == null || max < min) {
      print('Digite o peso máximo:');
      max = double.tryParse(stdin.readLineSync()!);
      if (max == null) {
        print('Valor inválido.');
      } else if (max < min) {
        print('Peso máximo deve ser maior ou igual ao mínimo.');
      }
    }

    List<Map<String, dynamic>> resultado = bois
        .where((b) => b['peso'] >= min && b['peso'] <= max)
        .toList();

    print('\n--- Bois com peso entre ${min.toStringAsFixed(1)} e ${max.toStringAsFixed(1)} kg ---');
    if (resultado.isEmpty) {
      print('Nenhum boi encontrado nesse intervalo.');
    } else {
      for (var b in resultado) {
        print('Boi nº ${b['numero']} - ${(b['peso'] as double).toStringAsFixed(1)} kg');
      }
    }
  }

  print('\nPrograma encerrado.');
}
