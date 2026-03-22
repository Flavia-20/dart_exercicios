main(){

  List<int> numeros =[];

  int pad_1 = 1;
  numeros.add(pad_1);
  int pad_2 = 5;
  numeros.add(pad_2);
  int pad_3 = 100;
  numeros.add(pad_3);

  while (numeros.length < 30) {
    pad_1 = pad_1 * 2;
    numeros.add(pad_1);

    pad_2 += 5;
    numeros.add(pad_2);

    pad_3 -= 10;
    numeros.add(pad_3);

  }

print(numeros);

}