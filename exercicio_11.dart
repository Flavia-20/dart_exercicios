import 'dart:io';

void main() {
  double somaHomens = 0;
  double somaMulheres = 0;
  int qtdHomens = 0;
  int qtdMulheres = 0;

  while (true) {
    int? codigo;
    while (codigo == null) {
      print('Digite o código do professor (9999 para sair):');
      codigo = int.tryParse(stdin.readLineSync()!);

      if (codigo == null) {
        print('Código inválido. Digite um número inteiro.');
      }
    }

    if (codigo == 9999) {
      break;
    }

    String nome = '';
    while (nome.trim().isEmpty) {
      print('Digite o nome do professor:');
      nome = stdin.readLineSync() ?? '';

      if (nome.trim().isEmpty) {
        print('Nome inválido. Digite um nome.');
      }
    }

    String sexo = '';
    while (sexo != 'M' && sexo != 'F') {
      print('Digite o sexo (M/F):');
      sexo = (stdin.readLineSync() ?? '').toUpperCase();

      if (sexo != 'M' && sexo != 'F') {
        print('Sexo inválido. Digite apenas M ou F.');
      }
    }

    double? horas;
    while (horas == null || horas < 0) {
      print('Digite o número de horas dadas no mês:');
      horas = double.tryParse(stdin.readLineSync()!);

      if (horas == null) {
        print('Valor inválido. Digite um número.');
      } else if (horas < 0) {
        print('As horas não podem ser negativas.');
      }
    }

    double salarioBruto = horas * 12.30;
    double desconto;
    double salarioLiquido;

    if (sexo == 'M') {
      desconto = salarioBruto * 0.10;
      salarioLiquido = salarioBruto - desconto;
      somaHomens += salarioLiquido;
      qtdHomens++;
    } else {
      desconto = salarioBruto * 0.05;
      salarioLiquido = salarioBruto - desconto;
      somaMulheres += salarioLiquido;
      qtdMulheres++;
    }

    print('\n--- DADOS DO PROFESSOR ---');
    print('Código: $codigo');
    print('Nome: $nome');
    print('Salário bruto: R\$ ${salarioBruto.toStringAsFixed(2)}');
    print('Salário líquido: R\$ ${salarioLiquido.toStringAsFixed(2)}');
    print('--------------------------\n');
  }

  double mediaHomens = qtdHomens > 0 ? somaHomens / qtdHomens : 0;
  double mediaMulheres = qtdMulheres > 0 ? somaMulheres / qtdMulheres : 0;

  print('\n=== RESULTADO FINAL ===');
  print('Média dos salários líquidos dos homens: R\$ ${mediaHomens.toStringAsFixed(2)}');
  print('Média dos salários líquidos das mulheres: R\$ ${mediaMulheres.toStringAsFixed(2)}');
}