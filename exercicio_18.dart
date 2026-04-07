import 'dart:io';

void main() {
  String palavra = "palavra";
  List<String> descoberta = [];

    for (int i = 0; i < palavra.length; i++) {
  descoberta.add("_");
    }
  int erros = 0;
  int maxErros = 6;
  
  while (erros < maxErros && descoberta.contains("_")) {
    print("Palavra: ${descoberta.join(" ")}");
    print("Digite uma letra:");
    String letra = stdin.readLineSync()!;
    bool acertou = false;

    for (int i = 0; i < palavra.length; i++) {
      if (palavra[i] == letra) {
        descoberta[i] = letra;
        acertou = true;
      }
    }

    if (acertou == false) {
      erros++;
      print("Errou. Total de erros: $erros");
    }
  }

  if (!descoberta.contains("_")) {
    print("Acertou, a palavra era $palavra");
  } else {
    print("Derrota. A palavra era $palavra");
  }
}