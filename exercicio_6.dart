import 'dart:math';
import 'dart:io';

void main() {
  
  var random = Random();
  int limite = 100;
  int randomNumber = random.nextInt(limite) + 1;

  while(true){
    print('Digite sua um numero entre 1 e $limite: ');
    String? linha = stdin.readLineSync();

    if (linha == null) {
      print('Entrada inválida. Tente novamente.');
      continue;
    }

    int? input = int.tryParse(linha);

    if (input == null) {
      print('Entrada inválida. Tente novamente.');
      continue;
    }

    if (input > randomNumber) {
      limite = input;
      print("O novo intervalo esta  entre 1 e $limite");
    }else {
      print("DIgite um número entre 1 e  $limite");
    }

    if (input == randomNumber){
      print("Parabéns! Você acertou o número $randomNumber!");
      break;
    }


  
  }

}