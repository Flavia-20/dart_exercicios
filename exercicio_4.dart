
import 'dart:io';

main() {

double media_aluno = 0.0;
double soma_medias_turma = 0.0;

int aprovados = 0;
int aluno_contagem = 0;

double maior_media_M = 0.0;
String? matriculaM = '00000';

double maior_media_f = 0.0;
String? matriculaF = '00000';

double soma_media_feminino = 0.0;
int qtd_feminino = 0;

 Set<String> matriculas = {};

String? funcaoMatricula(String? matricula, Set<String> matriculas) {

    if (matriculas.contains(matricula)) {
      print("Matrícula já existe! Digite outra.");
      String? novaMatricula = stdin.readLineSync();
      return funcaoMatricula(novaMatricula, matriculas);
    }

  if (matricula == null || matricula == "" || RegExp(r'[a-zA-Z]').hasMatch(matricula) || matricula.length != 5) {
    print("Matrícula inválida. Por favor, digite um número de matrícula válido ou '00000' para sair.");
    String? novaMatricula = stdin.readLineSync();
    if (novaMatricula == "00000") {
      print('Programa encerrado.');
      return exit(0);
    }
    return funcaoMatricula(novaMatricula, matriculas);
  }
  matriculas.add(matricula);
  return matricula;
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

String? funcaoNota1(String? nota1Input) {
    if (nota1Input == null || double.tryParse(nota1Input) == null || double.parse(nota1Input) < 0 || double.parse(nota1Input) > 10 || nota1Input == "" || RegExp(r'[a-zA-Z]').hasMatch(nota1Input)) {
      print("Nota inválida. Por favor, digite um número entre 0 e 10.");
      String? nota1Input = stdin.readLineSync();
      return funcaoNota1(nota1Input);
    }
    return nota1Input;
}

String? funcaoNota2(String? nota2Input) {
    if (nota2Input == null || double.tryParse(nota2Input) == null || double.parse(nota2Input) < 0 || double.parse(nota2Input) > 10 || nota2Input == "" || RegExp(r'[a-zA-Z]').hasMatch(nota2Input)) {
      print("Nota inválida. Por favor, digite um número entre 0 e 10.");
      String? nota2Input = stdin.readLineSync();
      return funcaoNota2(nota2Input);
    }
    return nota2Input;
}

String? funcaoNota3(String? nota3Input) {
    if (nota3Input == null || double.tryParse(nota3Input) == null || double.parse(nota3Input) < 0 || double.parse(nota3Input) > 10 || nota3Input == "" || RegExp(r'[a-zA-Z]').hasMatch(nota3Input)) {
      print("Nota inválida. Por favor, digite um número entre 0 e 10.");
      String? nota3Input = stdin.readLineSync();
      return funcaoNota3(nota3Input);
    }
    return nota3Input;
}

String? funcaoNumeroFaltas(String? faltasInput) {
    if (faltasInput == null || int.tryParse(faltasInput) == null || int.parse(faltasInput) < 0 || int.parse(faltasInput) > 20 || faltasInput == "" || RegExp(r'[a-zA-Z]').hasMatch(faltasInput)) {
      print("Número de faltas inválido. Por favor, digite um número entre 0 e 20.");
      String? faltasInput = stdin.readLineSync();
      return funcaoNumeroFaltas(faltasInput);
    }
    return faltasInput;
}

  while (true) {
    print('-----------------------------------------------------------------------');
    print('Digite a matricula do aluno com no máximo 5 digitos: (para sair digite 00000)');
    String? matricula = stdin.readLineSync();
    if (matricula == "00000") {
      print('Programa encerrado.');
      break;
    }
    String?  retornoMatricula = funcaoMatricula(matricula, matriculas);

    print("Digite o nome do aluno: ");
    String? nome = stdin.readLineSync();
    String? retornoNome = funcaoNome(nome);

    print("Digite o sexo do candidato (M/F): ");
    String? sexo = stdin.readLineSync();
    String? retornoSexo = funcaoSexo(sexo);

    print('digite a primeira nota do aluno: ');
    String? nota1Input = stdin.readLineSync();
    String? retornoNota1 = funcaoNota1(nota1Input);

    print('digite a segunda nota do aluno: ');
    String? nota2Input = stdin.readLineSync();
    String? retornoNota2 = funcaoNota2(nota2Input);

    print('digite a terceira nota do aluno: ');
    String? nota3Input = stdin.readLineSync(); 
    String? retornoNota3 = funcaoNota3(nota3Input); 

    media_aluno = (double.parse(retornoNota1!) + double.parse(retornoNota2!) + double.parse(retornoNota3!)) / 3;
    soma_medias_turma += media_aluno; 

    if (retornoSexo == 'F') {
      soma_media_feminino += media_aluno;
      qtd_feminino++;
    }

    print('DIgite o número de faltas do aluno: ');
    String? faltasInput = stdin.readLineSync();
    String? retornoFaltas = funcaoNumeroFaltas(faltasInput); 

    if (media_aluno >= 7.0 && int.parse(retornoFaltas!) <= 18) {
      print("Aluno aprovado!");
      aprovados++;

      if (retornoSexo == 'M' && media_aluno > maior_media_M) {
        maior_media_M = media_aluno;
        matriculaM = retornoMatricula;
      }

      if (retornoSexo == 'F' && media_aluno > maior_media_f) {
        maior_media_f = media_aluno;
        matriculaF = retornoMatricula;
      }
    }else {
      print("Aluno reprovado!");
    }

    aluno_contagem++;
  }

  double mediaTurma = soma_medias_turma / aluno_contagem;
  double percentual_aprovados = (aprovados / aluno_contagem) * 100;
  double media_feminino = qtd_feminino > 0 ? soma_media_feminino / qtd_feminino : 0;

  print('Média da turma: $mediaTurma');
  print('Percentual de aprovados: $percentual_aprovados%');
  print('A matricula do melhor aluno do sexo masculino aprovado: $matriculaM');
  print('A matricula do melhor aluno do sexo feminino aprovado: $matriculaF');
  print('Média dos alunos do sexo feminino: $media_feminino');
}