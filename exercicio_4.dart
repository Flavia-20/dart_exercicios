void main() {
  
  List<Map<String, dynamic>> alunos = [
    {
      'matricula': '12345',
      'nome': 'Andre',
      'sexo': 'M',
      'faltas': 2,
      'notas': [8.0, 7.5, 9.0]
    },
    {
      'matricula': '54321',
      'nome': 'Maria',
      'sexo': 'F',
      'faltas': 0,
      'notas': [9.0, 8.5, 9.5]
    },
    {
      'matricula': '67890',
      'nome': 'Joao',
      'sexo': 'M',
      'faltas': 5,
      'notas': [6.0, 5.5, 7.0]
    },
    {
      'matricula': '56896',
      'nome': 'MAteus',
      'sexo': 'M',
      'faltas': 18,
      'notas': [8.0, 4.5, 7.0]
    },
    {
      'matricula': '78965',
      'nome': 'Ana',
      'sexo': 'F',
      'faltas': 20,
      'notas': [7.0, 6.5, 8.0]
    },
  ];

  int total_alunos = alunos.length;
  int aprovados = 0;
  int reprovados = 0;

  double soma_medias_turma = 0.0;

  double soma_media_feminino = 0.0;
  int qtd_feminino = 0;

  double maior_media_M = 0.0;
  String? matriculaM;

  double maior_media_f = 0.0;
  String? matriculaF;

  for (var aluno in alunos) {
    List notas = aluno['notas'];
    double media = (notas[0] + notas[1] + notas[2]) / 3;
    print(media);

    soma_medias_turma += media;

    if (media >= 7.0 && aluno['faltas'] <= 18) {
      aprovados++;

      if (aluno['sexo'] == 'M' && media > maior_media_M) {
        maior_media_M = media;
        matriculaM = aluno['matricula'];
      }

      if (aluno['sexo'] == 'F' && media > maior_media_f) {
        maior_media_f = media;
        matriculaF = aluno['matricula'];
      }
    }
      else {
        reprovados++;
      }

    if (aluno['sexo'] == 'F') {
      soma_media_feminino += media;
      qtd_feminino++;
    }
  }

  double mediaTurma = soma_medias_turma / total_alunos;
  double percentual_aprovados = (aprovados / total_alunos) * 100;
    double percentual_reprovados = (reprovados / total_alunos) * 100;
  double media_feminino = qtd_feminino > 0 ? soma_media_feminino / qtd_feminino : 0;

  print('Média da turma: $mediaTurma');
  print('Percentual de aprovados: $percentual_aprovados%');
  print('Percentual de reprovados: $percentual_reprovados%');
  print('Melhor masculino aprovado: $matriculaM');
  print('Melhor feminina aprovada: $matriculaF');
  print('Média dos alunos do sexo feminino: $media_feminino');
}