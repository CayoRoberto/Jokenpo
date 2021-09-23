import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png"); // definir uma imagem para a variavel _imagemApp
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaDoApp = opcoes[numero];

    print("Opção selecionada: " + escolhaUsuario);
    print("Escolha do App: " + escolhaDoApp);

    //Exibição da imagem escolhida pelo App:
    switch(escolhaDoApp){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    // Validação do ganhador
    //Usuario Ganhador
    if(
        (escolhaUsuario == "pedra" && escolhaDoApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaDoApp == "pedra")   ||
        (escolhaUsuario == "tesoura" && escolhaDoApp == "papel")
    ){
        setState(() {
        this._mensagem = "Parabéns!!! Você ganhou :)";
        });
     }
    // App Ganhador
    else if(
    (escolhaUsuario == "pedra" && escolhaDoApp == "papel")   ||
    (escolhaUsuario == "papel" && escolhaDoApp == "tesoura") ||
    (escolhaUsuario == "tesoura" && escolhaDoApp == "pedra")
    ){
      setState(() {
        this._mensagem = "Você perdeu :(";
      });
    }
    else if(
    (escolhaUsuario == "pedra" && escolhaDoApp == "pedra")   ||
    (escolhaUsuario == "papel" && escolhaDoApp == "papel") ||
    (escolhaUsuario == "tesoura" && escolhaDoApp == "tesoura")
    ){
        setState(() {
        this._mensagem = "Empatamos ;)";
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,// centralizar coluna
                style: TextStyle(
                  fontSize: 20, // Tamanho da fonte
                  fontWeight: FontWeight.bold // colcoa texto em negrito
                )
              ),
            ),
              Image(image: this._imagemApp,), // carregar a imagem pela variavel _imagemApp
              // classe serve para detectar se a imagem foi clicada
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16), // espaçamento interno de 32pixels no topo e 16pixels baixo
                child: Text(
                    this._mensagem,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espaçar o conteudo na linha de maneira igual
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child: Image.asset("images/pedra.png", height: 100,), // height -> altura: 100 pixels
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: Image.asset("images/papel.png", height: 100,), // height -> altura: 100 pixels
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("tesoura"),
                    child: Image.asset("images/tesoura.png", height: 100,), // height -> altura: 100 pixels
                  ),

                  /*
                  Image.asset("images/pedra.png", height: 100,), // height -> altura: 100 pixels
                  Image.asset("images/papel.png", height: 100,),
                  Image.asset("images/tesoura.png", height: 100,)
                  */

                ],
              )
          ],
      )
    );
  }
}
