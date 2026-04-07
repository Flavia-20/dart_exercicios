import 'dart:io';

void main(){

    List mapa = [
        ["P",".",".","#","."],
        ["#","#",".","#","."],
        [".",".",".",".","."],
        [".","#","#","#","."],
        [".",".",".","S","."]
    ];

    int x = 0;
    int y = 0;

    while (true){
        for (int i = 0; i < 5; i++){
            print(mapa[i]);
        }

    print("Digite um movimento (wasd):");
    String mov = stdin.readLineSync()!;
    int nx = x;
    int ny = y;

    if (mov == "w") nx--;
    if (mov == "s") nx++;
    if (mov == "a") ny--;
    if (mov == "d") ny++;

    if (nx < 0 || nx >= 5 || ny < 0 || ny >= 5){
        print("fora do limite");
        continue;
    }

    if (mapa[nx][ny] == "#"){
        print("batendo na parede");
        continue;
    }

    if (mapa[nx][ny] == "S"){
        print("você venceu");
        break;
    }

    mapa[x][y] = ".";
    x = nx;
    y = ny;
    mapa[x][y] = "P";
    }
}