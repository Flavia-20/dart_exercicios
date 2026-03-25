import 'dart:io';

void main() {
  print('Digite um número inteiro:');
  int numero = int.parse(stdin.readLineSync()!);

  print('Número invertido:');

  while (numero > 0) {
    int digito = numero % 10;
    stdout.write(digito);
    numero ~/= 10;
  }

  print('');
}