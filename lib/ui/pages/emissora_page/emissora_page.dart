import 'package:flutter/material.dart';
import 'package:trabalho_falta_pos/models/models.dart';
import 'package:trabalho_falta_pos/ui/components/components.dart';

class EmissoraPage extends StatelessWidget {
  final Emissora emissora;

  const EmissoraPage(this.emissora, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(emissora.nome),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Imagem(emissora.logo)],
      ),
    );
  }
}
