import 'package:trabalho_falta_pos/constantes.dart';
import 'package:trabalho_falta_pos/infra/http/http.dart';
import 'package:trabalho_falta_pos/models/emissora.dart';

class EmissoraRemote {
  final _link = '${linkApiEmissoras}Emissoras/GetEmissora';
  final _clienteHttp = ClienteHttp();

  Future<List<Emissora>> get() async {
    final lista = await _clienteHttp.getJson(_link);
    return lista.map((e) => Emissora.fromMap(e)).toList();
  }
}