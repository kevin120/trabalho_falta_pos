import 'package:flutter/material.dart';
import 'package:trabalho_falta_pos/datasources/datasources.dart';
import 'package:trabalho_falta_pos/models/models.dart';
import 'package:trabalho_falta_pos/ui/components/components.dart';
import 'package:trabalho_falta_pos/ui/pages/home_page/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.tv),
            Text('Emissoras de TV - API'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: EmissoraRemote().get(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CirculoEspera();
                default:
                  if (snapshot.hasError) {
                    return GestureDetector(
                      child: MensagemErro('Erro ao acessar a API (${snapshot.error.toString()})'),
                      onTap: () { setState(() { }); },
                    );
                  }
                  else {
                    return ListaEmissora(snapshot.data as List<Emissora>);
                  }
              }
            },
          ))
        ],
      ),
    );
  }
}
