import 'package:flutter/material.dart';

class HistorialPedidosPage extends StatelessWidget {
  const HistorialPedidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Historial de Pedidos',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text('Contenido del historial de pedidos'),
      ),
    );
  }
}