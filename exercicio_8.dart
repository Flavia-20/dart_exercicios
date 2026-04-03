import 'dart:io';
main() {

  int maior_pontuacao_m = 0;
  int menor_pontuacao_m = 5000;
  String aluno_menor_pontuacao_m = "";

  int alunas_f = 0;
  int alunos_m = 0;

  List<Map<String, dynamic>> alunos2500 = [];

  Set<String> codigos = {};

String? funcaoCodigo(String? codigo, Set<String> codigos) {


  if (codigos.contains(codigo)) {
      print("Código já existe! Digite outro.");
      String? novoCodigo = stdin.readLineSync();
      return funcaoCodigo(novoCodigo, codigos);
  }

  if (codigo == null || codigo == "" || RegExp(r'[a-zA-Z]').hasMatch(codigo) || codigo.length != 4) {
    print("Código inválido. Por favor, digite um código válido ou '0000' para sair.");
    String? novoCodigo = stdin.readLineSync();

    if (novoCodigo == "0000") {
      print('Programa encerrado.');
      exit(0);
    }

    return funcaoCodigo(novoCodigo, codigos);
  }

  codigos.add(codigo);
  return codigo;
}

String? funcaoNome(String? nome) {
      if(nome == null || nome == "" || RegExp(r'[0-9]').hasMatch(nome) ) {
      print("Nome inválido. Por favor, digite um nome válido.");
      String? nome = stdin.readLineSync();
      return funcaoNome(nome);
    }
    return nome;
}

String? funcaoSexo(String? sexo) {
    if(sexo == null || (sexo.toUpperCase() != 'M' && sexo.toUpperCase() != 'F' || sexo == "")) {
      print("Sexo inválido. Por favor, digite 'M' para masculino ou 'F' para feminino.");
      String? sexo = stdin.readLineSync();
      return funcaoSexo(sexo);
    }
    return sexo.toUpperCase();
}

String? funcaoPontuacao(String? pontuacao) {
    if (pontuacao == null || int.tryParse(pontuacao) == null || int.parse(pontuacao) < 0 || int.parse(pontuacao) > 5000 || pontuacao == "") {
      print("Pontuação inválida. Por favor, digite um número entre 0 e 5000.");
      String? pontuacao = stdin.readLineSync();
      return funcaoPontuacao(pontuacao);
    }
    return pontuacao;
}

String removerAcentos(String texto) {
  var comAcento = 'áàãâäéèêëíìîïóòõôöúùûüçÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÇ';
  var semAcento = 'aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC';

  for (int i = 0; i < comAcento.length; i++) {
    texto = texto.replaceAll(comAcento[i], semAcento[i]);
  }
  return texto;
}

String? funcaoCurso(String? curso) {

  if(curso == null || curso == "") {
    print("Curso inválido. Por favor, digite 'CC-Ciência da Computação' ou 'SI-Sistemas de Informação'.");
    String? curso = stdin.readLineSync();
    return funcaoCurso(curso);
  }

  String cursoNormalizado = removerAcentos(curso).toUpperCase();
    if (cursoNormalizado != 'CC-CIENCIA DA COMPUTACAO' && cursoNormalizado != 'SI-SISTEMAS DE INFORMACAO') {
      print("Curso inválido. Por favor, digite 'CC-Ciência da Computação' ou 'SI-Sistemas de Informação'.");
      String? curso = stdin.readLineSync();
      return funcaoCurso(curso);
    }

  return cursoNormalizado.toUpperCase();
}


while (true) {
    print('-----------------------------------------------------------------------');
    print('Digite o codigo do aluno com no máximo 4 digitos: (para sair digite 0000)');
    String? codigo = stdin.readLineSync();
    if (codigo == "0000") {
      print('Programa encerrado.');
      break;
    }
    String?  retornoCodigo = funcaoCodigo(codigo, codigos);

    print("Digite o nome do aluno: ");
    String? nome = stdin.readLineSync();
    String? retornoNome = funcaoNome(nome);

    print("Digite o sexo do candidato (M/F): ");
    String? sexo = stdin.readLineSync();
    String? retornoSexo = funcaoSexo(sexo);

    print("Digite a pontuação do aluno: ");
    String? pontuacao = stdin.readLineSync();
    String? retornoPontuacao = funcaoPontuacao(pontuacao);

    print("Digite o curso do aluno (CC-Ciência da Computação ou SI-Sistemas de Informação): ");
    String? curso = stdin.readLineSync();
    String? retornoCurso = funcaoCurso(curso);


    if(int.parse(retornoPontuacao!) > 2500 && retornoCurso == 'CC-CIENCIA DA COMPUTACAO'){
      alunos2500.add({
        'codigo': retornoCodigo,
        'nome': retornoNome,
        'pontuacao': retornoPontuacao
      });
    } 

     if(retornoSexo == 'M' && int.parse(retornoPontuacao) < menor_pontuacao_m ){
      menor_pontuacao_m = int.parse(retornoPontuacao);
      aluno_menor_pontuacao_m = " é ${retornoNome}  com $menor_pontuacao_m";
    }

    if(retornoSexo == 'M' && int.parse(retornoPontuacao) > maior_pontuacao_m && retornoCurso == 'SI-Sistemas de Informação'){
      maior_pontuacao_m = int.parse(retornoPontuacao);
      print("A maior pontuação entre os alunos de SI do sexo masculino é de ${retornoNome}, com código ${retornoCodigo} com pontuação de $maior_pontuacao_m");
    }

    if(retornoSexo == 'F'){
      alunas_f++;
    }else{
      alunos_m++;
    }
  }

  print("Alunos com mais de 2500 pontos:");
  for (var aluno in alunos2500) {
    print("Código: ${aluno['codigo']}, Nome: ${aluno['nome']}, Pontuação: ${aluno['pontuacao']}");
  }
  print("Aluno com menor pontuação entre os do sexo masculino: $aluno_menor_pontuacao_m");
  double percentual_alunas = (alunas_f / (alunas_f + alunos_m)) * 100;
  print("O percentual de alunas é de $percentual_alunas%");
  double percentual_alunos = (alunos_m / (alunas_f + alunos_m)) * 100;
  print("O percentual de alunos é de $percentual_alunos%");
}




