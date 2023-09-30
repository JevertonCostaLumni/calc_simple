import 'package:calc_simple/app/entities/hive_data.dart';
import 'package:flutter/material.dart';

class ModalBsCustom extends StatelessWidget {
  final List<Dados> listaDeDados;

  const ModalBsCustom({Key? key, required this.listaDeDados}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 25,
        ),
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Confira seu Histórico de IMC',
            style: TextStyle(color: Colors.deepPurple, fontSize: 18),
          ),
        ),
        DataTable(
          columns: const [
            DataColumn(label: Text('Altura')),
            DataColumn(label: Text('Peso ')),
            DataColumn(label: Text('Resultado')),
          ],
          rows: listaDeDados.map((dados) {
            return DataRow(
              cells: [
                DataCell(Text(dados.altura.toString())),
                DataCell(Text(dados.peso.toString())),
                DataCell(Text(dados.resultado)),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
