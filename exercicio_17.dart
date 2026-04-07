void main() {
  List<int> vetor1 = [1, 2, 3];
  List<int> vetor2 = [1, 2];

  if (vetor1.length != vetor2.length) {
    return print("Vetores tem que ter tamanhos iguais");
  }

  List<int> vetor3 = [];

  for (int i = 0; i < vetor1.length; i++) {
    vetor3.add(vetor1[i] + vetor2[i]);
  }

  print("Vetor 3: $vetor3");

  int somaTotal = 0;
  for (var x in vetor3) {
    somaTotal += x;
  }

  print("Soma do vetor 3:  $somaTotal");
}
