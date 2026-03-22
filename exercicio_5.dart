void main() {
  
  List<Map<String, dynamic>> bebes = [
    {
      'nome': 'Andre',
      'sexo': 'M',
      'peso': 2.0
    },
    {
      'nome': 'Maria',
      'sexo': 'F',
      'peso': 3.0
    },
    {
      'nome': 'Joao',
      'sexo': 'M',
      'peso': 1.0
    },
    {
      'nome': 'MAteus',
      'sexo': 'M',
      'peso': 4.0
    },
    {
      'nome': 'Ana',
      'sexo': 'F',
      'peso': 5.0
    },
    
  ];

  double maior_peso_f = 0.0;
  String? nome_f;

  int total_bebes = bebes.length;
  double bebes_baixo_peso = 0;
  double bebes_peso_medio = 0;
  double bebes_peso_alto = 0;


  for (var bebe in bebes) {
    double peso = bebe['peso'];
    if (peso < 2.0) {
      bebes_baixo_peso++;
      print("Bebê ${bebe['nome']}, sexo ${bebe['sexo']}, tem baixo peso");
    } else if (peso >= 2.0 && peso <= 4.0) {
      bebes_peso_medio++;
      print("Bebê ${bebe['nome']}, sexo ${bebe['sexo']}, tem peso médio");
    } else {
      bebes_peso_alto++;
      print("Bebê ${bebe['nome']}, sexo ${bebe['sexo']}, tem alto peso");
    }

  
    if (bebe['sexo'] == 'F' && peso > maior_peso_f) {
      maior_peso_f = peso;
      nome_f = bebe['nome'];
    }
  }

  double percentual_baixo_peso = (bebes_baixo_peso / total_bebes) * 100;
  double percentual_peso_medio = (bebes_peso_medio / total_bebes) * 100;
  double percentual_peso_alto = (bebes_peso_alto / total_bebes) * 100;

  print('Percentual de bebês com baixo peso: $percentual_baixo_peso%');
  print('Percentual de bebês com peso médio: $percentual_peso_medio%');
  print('Percentual de bebês com alto peso: $percentual_peso_alto%');
  print('Bebê do sexo feminino com maior peso: $nome_f');
}