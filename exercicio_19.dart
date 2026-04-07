import 'dart:io';

void main() {
  List tabuleiro = [
    [" ", " ", " "],
    [" ", " ", " "],
    [" ", " ", " "]
  ];

  String jogador = "X";

  for (int jogadas = 0; jogadas < 9; jogadas++) {
    print("   1   2   3");

    for (int i = 0; i < 3; i++) {
      print("${i + 1}  ${tabuleiro[i][0]} | ${tabuleiro[i][1]} | ${tabuleiro[i][2]}");
    }

    print("Jogador $jogador");

    print("Linha (1-3):");
    int l = int.parse(stdin.readLineSync()!) - 1;

    print("Coluna (1-3):");
    int c = int.parse(stdin.readLineSync()!) - 1;

    if (tabuleiro[l][c] == " ") {
      tabuleiro[l][c] = jogador;
    } else {
      print("Posição ocupada");
      jogadas--;
      continue;
    }

    if (
      (tabuleiro[0][0] == jogador && tabuleiro[0][1] == jogador && tabuleiro[0][2] == jogador) ||
      (tabuleiro[1][0] == jogador && tabuleiro[1][1] == jogador && tabuleiro[1][2] == jogador) ||
      (tabuleiro[2][0] == jogador && tabuleiro[2][1] == jogador && tabuleiro[2][2] == jogador) ||
      (tabuleiro[0][0] == jogador && tabuleiro[1][0] == jogador && tabuleiro[2][0] == jogador) ||
      (tabuleiro[0][1] == jogador && tabuleiro[1][1] == jogador && tabuleiro[2][1] == jogador) ||
      (tabuleiro[0][2] == jogador && tabuleiro[1][2] == jogador && tabuleiro[2][2] == jogador) ||
      (tabuleiro[0][0] == jogador && tabuleiro[1][1] == jogador && tabuleiro[2][2] == jogador) ||
      (tabuleiro[0][2] == jogador && tabuleiro[1][1] == jogador && tabuleiro[2][0] == jogador)
    ) {
      print("\nTabuleiro final:");
      print("   1   2   3");

      for (int i = 0; i < 3; i++) {
        print("${i + 1}  ${tabuleiro[i][0]} | ${tabuleiro[i][1]} | ${tabuleiro[i][2]}");
      }

      print("Jogador $jogador venceu!");
      return;
    }

    if (jogador == "X") {
      jogador = "O";
    } else {
      jogador = "X";
    }
  }

  print("\nTabuleiro final:");
  print("   1   2   3");

  for (int i = 0; i < 3; i++) {
    print("${i + 1}  ${tabuleiro[i][0]} | ${tabuleiro[i][1]} | ${tabuleiro[i][2]}");
  }

  print("Empate!");
}