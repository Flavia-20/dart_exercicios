void main() {
  List<int> vetor1 = [1, 3];
  List<int> vetor2 = [2, 3];
  List<int> vetor3 = [3, 4];
  List<int> vetor4 = [3, 0];

  List<int> vetor5 = [];
  vetor5.addAll(vetor1);
  vetor5.addAll(vetor2);
  vetor5.addAll(vetor3);
  vetor5.addAll(vetor4);

  vetor5.sort();
  print("Vetor ordenado: $vetor5");

  Set<int> vetor6 = vetor1
      .toSet()
      .intersection(vetor2.toSet())
      .intersection(vetor3.toSet())
      .intersection(vetor4.toSet());

  print("Os 4 vetores juntos: $vetor6");
}
