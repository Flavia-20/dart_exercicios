void main() {
  List<int> vetor = [3, 8, 5, 3, 8, 7, 3, 7, 3, 7];

  Map<int, int> contagem = {};

  for (int num in vetor) {
    contagem[num] = (contagem[num] ?? 0) + 1;
  }

  contagem.forEach((numero, qtd) {
    print("$numero - $qtd");
  });
}