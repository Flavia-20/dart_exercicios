main() {

  for (int i = 1000; i < 10000; i++) {

    String numero = i.toString();

    String dois_primeiros_digitos = numero.substring(0, 2);
    String dois_ultimos_digitos = numero.substring(2, 4);

    int soma_digitos = int.parse(dois_primeiros_digitos) + int.parse(dois_ultimos_digitos);

    int multiplicacao_digitos = soma_digitos * soma_digitos;

    if (multiplicacao_digitos == i) {
      print("O número $i é igual a $multiplicacao_digitos. Ou seja é um kaprekar.");
    }
   
    
  }
  
}