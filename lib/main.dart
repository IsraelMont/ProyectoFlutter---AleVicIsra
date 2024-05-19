import 'package:farmaciaapp/carrito_compras_page.dart';
import 'package:farmaciaapp/historial_pedidos_page.dart';
import 'package:farmaciaapp/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmacia',
      theme: ThemeData(primarySwatch: Colors.blueGrey), 
        
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       // useMaterial3: true,
      
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomePage(),
        '/carrito': (context) => const CarritoComprasPage(),
        '/historial': (context) => const HistorialPedidosPage(),
      },
    );
  }
}



// Agrega la clase HomePage aquí

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medicamentos',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showSearchDialog(context);
            },
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/carrito');
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          _buildCategoryTile('Analgesicos', 'assets/images/analgesicos.png', Colors.blue),
          _buildCategoryTile('Antibioticos', 'assets/images/antibioticos.png', Colors.green),
          _buildCategoryTile('Antiinflamatorios', 'assets/images/anti.png', Colors.orange),
          _buildCategoryTile('Antivirales', 'assets/images/antivirales.png', Colors.blue),
          _buildCategoryTile('Antifúngicos', 'assets/images/Antifúngicos.png', Colors.purple),
          _buildCategoryTile('Antidepresivos', 'assets/images/Antidepresivos.png', Colors.indigo),
          _buildCategoryTile('Fotoprotectores', 'assets/images/fotoprotectores.png', Colors.orange),
          _buildCategoryTile('Anticonvulsivos', 'assets/images/Anticonvulsivos.png', Colors.brown),
          _buildCategoryTile('Diuréticos', 'assets/images/Diuréticos.png', Colors.deepOrangeAccent),
          _buildCategoryTile('Antihipertensivos', 'assets/images/Antihipertensivos.png', Colors.blueAccent),
        ],
      ),
    );
  }

  Widget _buildCategoryTile(String title, String imagePath, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        ),
        leading: Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        onTap: () {
          // Aquí puedes implementar la lógica para navegar a la lista de medicamentos de esta categoría          
        },
      ),
    );
  }

  static _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Buscar Medicamentos'),
          content: TextField(
            decoration: const InputDecoration(hintText: 'Ingrese el nombre del medicamento'),
            onChanged: (String value) {
              // Aquí puedes implementar la lógica para filtrar los medicamentos mientras el usuario escribe
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Aquí puedes implementar la lógica para realizar la búsqueda
              },
              child: const Text('Buscar'),
            ),
          ],
        );
      },
    );
  }
}



//
class MedicamentosPage extends StatelessWidget {
  final String categoria;

  const MedicamentosPage({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoria),
      ),
      body: Center(
        child: Text('Aquí se mostrarán los medicamentos de la categoría $categoria'),
      ),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/