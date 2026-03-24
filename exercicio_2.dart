import 'dart:math';

BigInt fatorial(int n) {
  BigInt fat = BigInt.one;
  for (int i = 1; i <= n; i++) {
    fat *= BigInt.from(i);
  }
  return fat;
}

void main() {
  int n = 3;
  double soma = 0;

  for (int i = 1; i <= n; i++) {
    int base = 2 * i + 1;
    int denominador = 5 * i;

    int valorFatorial = (4 * i);
    BigInt expoente = fatorial(valorFatorial);
    double termo = pow(base, expoente.toInt()) / denominador;

    if (i > 3 && i % 2 == 0) {
      termo *= -1;
    }

    soma += termo;
  }

  print("Soma: $soma");
}