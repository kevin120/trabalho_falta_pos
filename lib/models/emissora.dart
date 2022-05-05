import 'package:trabalho_falta_pos/constantes.dart';
import 'package:trabalho_falta_pos/extensions/extensions.dart';

class Emissora {
  int codigo;
  String nome;
  String logo;

  Emissora({required this.codigo, required this.nome, required this.logo});

  factory Emissora.fromMap(Map<String, dynamic> mapa) {
    return Emissora(codigo: mapa['Emi_Codigo'].toString().toInt(),
        nome: mapa['Emi_Nome'] ?? '',
        logo: (mapa['Emi_Logo'] ?? '').toString()
        .replaceAll('~/', linkApi)
    );
  }
}