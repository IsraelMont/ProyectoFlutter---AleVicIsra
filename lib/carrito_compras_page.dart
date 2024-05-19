import 'package:flutter/material.dart';

class CarritoComprasPage extends StatelessWidget {
  const CarritoComprasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carrito de Compras',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text('Contenido del carrito de compras'),
      ),
    );
  }
}
