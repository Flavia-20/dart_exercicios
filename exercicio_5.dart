import 'dart:io';

main(){

  double maior_peso_f = 0.0;
  String? nome_f;

  int total_bebes = 0;
  double bebes_baixo_peso = 0;
  double bebes_peso_medio = 0;
  double bebes_peso_alto = 0;

  String? funcaoNomeBebe(String? nome) {
      if(nome == null || nome == "" || RegExp(r'[0-9]').hasMatch(nome) ) {
      print("Nome inválido. Por favor, digite um nome válido.");
      String? nome = stdin.readLineSync();
      if (nome == 'FIM') {
        print('Programa encerrado.');
        exit(0);
      }
      return funcaoNomeBebe(nome);
    }
    return nome;
  }

  String? funcaoSexoBebe(String? sexo) {
    if(sexo == null || (sexo.toUpperCase() != 'M' && sexo.toUpperCase() != 'F' || sexo == "")) {
      print("Sexo inválido. Por favor, digite 'M' para masculino ou 'F' para feminino.");
      String? sexo = stdin.readLineSync();
      return funcaoSexoBebe(sexo);
    }
    return sexo.toUpperCase();
  }

String? funcaoPesoBebe(String? peso) {
    if (peso == null || double.tryParse(peso) == null || double.parse(peso) <= 0 || double.parse(peso) >= 10 || peso == "" || RegExp(r'[a-zA-Z]').hasMatch(peso)) {
      print("Peso inválido. Por favor, digite um número positivo.");
      String? peso = stdin.readLineSync();
      return funcaoPesoBebe(peso);
    }
    return peso;
  }


while (true) {
  print("Digite o nome do bebe: ");
  String? nome = stdin.readLineSync();
  if (nome == 'FIM') {
    print('Programa encerrado.');
    break;
  }
  String? retornoNomeBebe = funcaoNomeBebe(nome);


  print("Digite o sexo do candidato (M/F): ");
  String? sexo = stdin.readLineSync();
  String? retornoSexoBebe = funcaoSexoBebe(sexo);


  print("Digite o peso do bebê: ");
  String? peso = stdin.readLineSync();
  String? retornoPesoBebe = funcaoPesoBebe(peso);
 
  if(double.parse(retornoPesoBebe!) < 2.0) {
      bebes_baixo_peso++;
      print("==== Bebê $retornoNomeBebe, sexo $retornoSexoBebe, tem baixo peso");
    } else if (double.parse(retornoPesoBebe) >= 2.0 && double.parse(retornoPesoBebe) <= 4.0) {
      bebes_peso_medio++;
      print("==== Bebê $retornoNomeBebe, sexo $retornoSexoBebe, tem peso médio");
    } else {
      bebes_peso_alto++;
      print("==== Bebê $retornoNomeBebe, sexo $retornoSexoBebe, tem alto peso");
    }

  
    if (retornoSexoBebe == 'F' && double.parse(retornoPesoBebe) > maior_peso_f) {
      maior_peso_f = double.parse(retornoPesoBebe);
      nome_f = retornoNomeBebe;
    }

    total_bebes++;
  }

  double percentual_baixo_peso = (bebes_baixo_peso / total_bebes) * 100;
  double percentual_peso_medio = (bebes_peso_medio / total_bebes) * 100;
  double percentual_peso_alto = (bebes_peso_alto / total_bebes) * 100;

  print('Percentual de bebês com baixo peso: $percentual_baixo_peso%');
  print('Percentual de bebês com peso médio: $percentual_peso_medio%');
  print('Percentual de bebês com alto peso: $percentual_peso_alto%');
  print('Bebê do sexo feminino com maior peso: $nome_f');

}
