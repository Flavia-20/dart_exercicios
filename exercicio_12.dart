import 'dart:io';

void main() {
  String entrada = '';

  while (true) {
    print('Digite um número inteiro:');
    entrada = (stdin.readLineSync() ?? '').trim();

    if (entrada.isEmpty) {
      print('Você precisa digitar um número.\n');
    } else if (int.tryParse(entrada) == null) {
      print('Entrada inválida. Digite apenas números inteiros.\n');
    } else if (int.parse(entrada) < 0) {
      print('Digite um número inteiro positivo.\n');
    } else {
      break;
    }
  }

  int numero = int.parse(entrada);

  print('Número invertido:');

  if (numero == 0) {
    print('0');
    return;
  }

  while (numero > 0) {
    int digito = numero % 10;
    stdout.write(digito);
    numero ~/= 10;
  }

  print('');
}
