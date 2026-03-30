import 'dart:io';

List<int> lerVetor(String nome) {
  int? tamanho;
  while (tamanho == null || tamanho <= 0) {
    print('Digite o tamanho do $nome:');
    tamanho = int.tryParse(stdin.readLineSync()!);
    if (tamanho == null || tamanho <= 0) {
      print('Tamanho inválido. Digite um número inteiro positivo.');
    }
  }

  List<int> vetor = [];
  int? ultimo;

  for (int i = 0; i < tamanho; i++) {
    int? elemento;
    while (true) {
      print('Digite o elemento ${i + 1} do $nome:');
      elemento = int.tryParse(stdin.readLineSync()!);
      if (elemento == null) {
        print('Valor inválido. Digite um número inteiro.');
        continue;
      }
      if (ultimo != null && elemento < ultimo) {
        print('Valor deve ser >= $ultimo (vetor deve estar ordenado).');
        continue;
      }
      break;
    }
    vetor.add(elemento!);
    ultimo = elemento;
  }

  return vetor;
}

List<int> mesclarVetores(List<int> a, List<int> b) {
  List<int> resultado = [];
  int i = 0, j = 0;

  while (i < a.length && j < b.length) {
    if (a[i] <= b[j]) {
      resultado.add(a[i++]);
    } else {
      resultado.add(b[j++]);
    }
  }

  while (i < a.length) resultado.add(a[i++]);
  while (j < b.length) resultado.add(b[j++]);

  return resultado;
}

void main() {
  print('=== Mesclagem de dois vetores ordenados ===\n');

  List<int> vetor1 = lerVetor('vetor 1');
  print('');
  List<int> vetor2 = lerVetor('vetor 2');

  List<int> vetorMesclado = mesclarVetores(vetor1, vetor2);

  print('\nVetor 1: $vetor1');
  print('Vetor 2: $vetor2');
  print('Vetor mesclado: $vetorMesclado');
}
