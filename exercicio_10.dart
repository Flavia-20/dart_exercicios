import 'dart:io';

main(){

  int numero_candicatas_mulheres = 0;
  int numero_candidatos_homens = 0;

  //int candidatos_com_experiencia = 0;

  double soma_idade_candidatos_m_com_experiencia = 0.0;
  double candidatos_m_com_experiencia = 0.0;
  
  int homens_idade_maior_45 = 0;
 
  int mulheres_idade_menos_30_com_experiencia = 0;



  while (true) {
    print('---------------------------------------');
    print("Digite o nome do candidato: ");
    String? nome = stdin.readLineSync();
    if (nome == null || RegExp(r'[0-9]').hasMatch(nome) || nome == "") {
      print("Nome inválido. Por favor, digite um nome válido.");
      continue;
    }

    if(nome.toUpperCase() == 'FIM') {
      break;
    }

    
    print("Digite o sexo do candidato (M/F): ");
    String? sexo = stdin.readLineSync();
    if(sexo == null || (sexo.toUpperCase() != 'M' && sexo.toUpperCase() != 'F' || sexo == "")) {
      print("Sexo inválido. Por favor, digite 'M' para masculino ou 'F' para feminino.");
      continue;
    }
    sexo = sexo.toUpperCase();
    if (sexo == 'M') {
      numero_candidatos_homens++;
    } else if (sexo == 'F') {
      numero_candicatas_mulheres++;
    }


    print("Digite a idade do candidato: ");
    String? idadeInput = stdin.readLineSync();
    if (idadeInput == null || int.tryParse(idadeInput) == null || int.parse(idadeInput) <= 0 || int.parse(idadeInput) >= 100 || idadeInput == "") {
      print("Idade inválida. Por favor, digite um número inteiro positivo.");
      continue;
    }
    if (int.tryParse(idadeInput)! > 45 && sexo == 'M'){
        homens_idade_maior_45++;
    }

    print("Digite se tem experiencia no serviço (S/N): ");
    String? experiencia = stdin.readLineSync();   
    if (experiencia == null || (experiencia.toUpperCase() != 'S' && experiencia.toUpperCase() != 'N') || experiencia == "") {
      print("Resposta inválida. Por favor, digite 'S' para sim ou 'N' para não.");
      continue;
    }


    if(sexo == 'M' && experiencia.toUpperCase() == 'S') {
      candidatos_m_com_experiencia++;
      soma_idade_candidatos_m_com_experiencia += int.parse(idadeInput);
    }

    if(sexo == 'F' && experiencia.toUpperCase() == 'S' && int.parse(idadeInput) < 30) {
      mulheres_idade_menos_30_com_experiencia++;
    }

  }

  double media_idade_candidatos_com_experiencia = soma_idade_candidatos_m_com_experiencia / candidatos_m_com_experiencia;

  double porcentagem_homens_idade_maior_45 = (homens_idade_maior_45 / numero_candidatos_homens) * 100;


  print('Número de candidatas mulheres: $numero_candicatas_mulheres');
  print('Número de candidatos homens: $numero_candidatos_homens');
  print('idade media dos homens com experiencia: $media_idade_candidatos_com_experiencia');
  print('Porcentagem de homens com idade maior que 45: $porcentagem_homens_idade_maior_45%');
  print('Número de mulheres com idade menor que 30 e com experiencia: $mulheres_idade_menos_30_com_experiencia');

}