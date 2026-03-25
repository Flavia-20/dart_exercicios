void main() {

  List<Map<String, dynamic>> alunos = [
    {
      'codigo': '1234',
      'curso': 'CC-Ciência da Computação',
      'nome': 'Andre',
      'sexo': 'M',
      'pontuação': 2500
    },
    {
      'codigo': '5678',
      'curso': 'SI-Sistemas de Informação',
      'nome': 'Maria',
      'sexo': 'F',
      'pontuação': 2800
    },
    {
      'codigo': '9012',
      'curso': 'CC-Ciência da Computação',
      'nome': 'Joao',
      'sexo': 'M',
      'pontuação': 2200
    },
    {
      'codigo': '3456',
      'curso': 'CC-Ciência da Computação',
      'nome': 'MAteus',
      'sexo': 'M',
      'pontuação': 3500
    },
    {
      'codigo': '7890',
      'curso': 'SI-Sistemas de Informação',
      'nome': 'Ana',
      'sexo': 'F',
      'pontuação': 2800
    },
    {
      'codigo': '1122',
      'curso': 'CC-Ciência da Computação',
      'nome': 'Carlos', 
      'sexo': 'M',
      'pontuação': 2800
    },
    {
      'codigo': '3344',
      'curso': 'SI-Sistemas de Informação',
      'nome': 'Pedro', 
      'sexo': 'M',
      'pontuação': 2400
    },
  ];

  int maior_pontuacao_m = 0;
  int menor_pontuacao_m = 5000;
  String aluno_menor_pontuacao_m = "";

  int alunas_m = 0;
  int alunos_m = 0;

  var alunos_com_mais_de_2500_pontos = [];

  for(var aluno in alunos){
    if(aluno['pontuação'] > 2500 && aluno['curso'] == 'CC-Ciência da Computação'){
      alunos_com_mais_de_2500_pontos.add(aluno);
    } 

     if(aluno['sexo'] == 'M' && aluno['pontuação'] < menor_pontuacao_m ){
      menor_pontuacao_m = aluno['pontuação'];
      aluno_menor_pontuacao_m = " é ${aluno['nome']}  com $menor_pontuacao_m";
    }

    if(aluno['sexo'] == 'M' && aluno['pontuação'] > maior_pontuacao_m && aluno['curso'] == 'SI-Sistemas de Informação'){
      maior_pontuacao_m = aluno['pontuação'];
      print("A maior pontuação entre os alunos de SI do sexo masculino é de ${aluno['nome']}, com código ${aluno['codigo']} com pontuação de $maior_pontuacao_m");
    }

    if(aluno['sexo'] == 'F'){
      alunas_m++;
    }else{
      alunos_m++;
    }
  }

  print("Alunos que fizeram mais de 2500 pontos. $alunos_com_mais_de_2500_pontos");
  print("Aluno com menor pontuação entre os do sexo masculino: $aluno_menor_pontuacao_m");
  double percentual_alunas = (alunas_m / (alunas_m + alunos_m)) * 100;
  print("O percentual de alunas é de $percentual_alunas%");
  double percentual_alunos = (alunos_m / (alunas_m + alunos_m)) * 100;
  print("O percentual de alunos é de $percentual_alunos%");
}