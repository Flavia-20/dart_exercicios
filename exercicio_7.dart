import 'dart:math';

int fatorial(int n) {
  int fat = 1;
  for (int i = 1; i <= n; i++) {
    fat *= i;
  }
  return fat;
}

void main() {
  int n = 10;
  double x = 2;
  double S = 0;

  int fatAtual = 1;
  bool subindo = true;

  for (int i = 1; i <= n; i++) {
    int expoente = i + 1;

    double termo = pow(x, expoente) / fatorial(fatAtual);
    S += termo;

    if (subindo) {
      fatAtual++;
      if (fatAtual == 4) subindo = false;
    } else {
      fatAtual--;
      if (fatAtual == 1) subindo = true;
    }
  }

  print("Soma: $S");
}