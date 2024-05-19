
import 'package:farmaciaapp/main.dart'; // Importa el archivo principal de la aplicación
import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario
import 'package:farmaciaapp/user_credentials.dart'; // Importa las credenciales de usuario

// Define una clase StatefulWidget para la página de inicio de sesión
class LoginPage extends StatefulWidget {
  // Constructor de la clase LoginPage
  const LoginPage({super.key}); 

  @override
  // Crea el estado de la página de inicio de sesión
  State<LoginPage> createState() => _LoginPageState();  
}

// Define la clase de estado para LoginPage
class _LoginPageState extends State<LoginPage> {
  // Define el color principal de la interfaz
  late Color myColor = Colors.blueGrey; 
  // Define una variable para el tamaño de la pantalla
  late Size mediaSize;  
  // Controlador para el campo de correo electrónico
  TextEditingController emailController = TextEditingController();  
  // Controlador para el campo de contraseña
  TextEditingController passwordController = TextEditingController(); 
  bool rememberUser = false;  // Variable para recordar al usuario

  // Credenciales de usuario predefinidas
  final UserCredentials predefinedCredentials = UserCredentials(
    email: 'Alexa1@gmail.com',
    password: '12345678',
  );

  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla
    mediaSize = MediaQuery.of(context).size;  
    return Container(
      decoration: BoxDecoration(
        color: myColor, // Color de fondo
        image: DecorationImage(
          image: const AssetImage("assets/images/lo.png"),  // Imagen de fondo
          fit: BoxFit.cover,  // Ajusta la imagen para cubrir toda el área
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),  // Aplica un filtro de color a la imagen
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,  // Hace transparente el fondo del Scaffold
        body: Stack(children: [
          Positioned(top: 80, child: _buildTop()),  // Posiciona la parte superior
          Positioned(bottom: 0, child: _buildBottom()), // Posiciona la parte inferior
        ]),
      ),
    );
  }

  // Construye la parte superior de la interfaz
  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width, // Ajusta el ancho al tamaño de la pantalla
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.local_pharmacy,
            size: 100,  // Tamaño del ícono
            color: Colors.white,  // Color del ícono
          ),
          Text(
            "FARMACIA",
            style: TextStyle(
                color: Colors.white,  // Color del texto
                fontWeight: FontWeight.bold,  // Negrita
                fontSize: 40, // Tamaño de fuente
                letterSpacing: 2),  
          )
        ],
      ),
    );
  }

  // Construye la parte inferior de la interfaz
  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width, // Ajusta el ancho al tamaño de la pantalla
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), // Bordes redondeados en la parte superior izquierda
          topRight: Radius.circular(30),  // Bordes redondeados en la parte superior derecha
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),  // Margen interno de 32 píxeles
          child: _buildForm(),  // Llama al método para construir el formulario
        ),
      ),
    );
  }

  // Construye el formulario de inicio de sesión
  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bienvenido",
          style: TextStyle(
              color: myColor, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        _buildGreyText("Por favor inicia sesión con tu información"),
        const SizedBox(height: 60), // Espaciado
        _buildGreyText("Dirección de correo electrónico"),  // Texto gris
        _buildInputField(emailController),  // Campo de entrada de correo electrónico
        const SizedBox(height: 40), // Espaciado
        _buildGreyText("Contraseña"), // Texto gris
        _buildInputField(passwordController, isPassword: true), // Campo de entrada de contraseña
        const SizedBox(height: 20), // Espaciado
        _buildRememberForgot(), // Construye la fila de recordar y olvidar contraseña
        const SizedBox(height: 20), // Espaciado
        _buildLoginButton(),  // Botón de inicio de sesión
        const SizedBox(height: 20), // Espaciado
        _buildOtherLogin(), // Otras opciones de inicio de sesión
      ],
    );
  }

  // Construye un texto gris
  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  // Construye un campo de entrada
  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller, // Controlador del campo
      decoration: InputDecoration(
        // Ícono al final del campo
        suffixIcon: isPassword ? const Icon(Icons.remove_red_eye) : const Icon(Icons.done),
      ),
      obscureText: isPassword,  // Oculta el texto si es una contraseña
    );
  }

  // Construye la fila de recordar usuario y olvidar contraseña
  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Espaciado entre elementos
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _buildGreyText("Recordar"),
          ],
        ),
        TextButton(
            // Botón para olvidar contraseña
            onPressed: () {}, child: _buildGreyText("Olvidé mi contraseña"))
      ],
    );
  }

  // Construye el botón de inicio de sesión
  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _login,  // Llama al método de inicio de sesión
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(), // Borde del botón
        elevation: 20,  // Elevación del botón
        shadowColor: myColor, // Color de la sombra
        minimumSize: const Size.fromHeight(60),  // Tamaño mínimo
      ),
      child: const Text("Iniciar Sesion"),  // Texto del botón
    );
  }

  // Método de inicio de sesión
  void _login() { // Método añadido aquí
    // Verifica las credenciales del usuario
    if (emailController.text == predefinedCredentials.email &&
      passwordController.text == predefinedCredentials.password) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()), // Navega a la página principal
    );
    } else {
      // Muestra un mensaje de error si las credenciales son incorrectas
      showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error de inicio de sesión'),
          content: const Text('Las credenciales ingresadas son incorrectas.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
  }

  // Construye otras opciones de inicio de sesión
  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          _buildGreyText("O inicia sesion con"),  // Texto gris
          const SizedBox(height: 10), // Espaciado
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espaciado entre elementos
            children: [
              Tab(icon: Image.asset("assets/images/facebook.png")), // Opción de Facebook
              Tab(icon: Image.asset("assets/images/twitter.png")),  // Opción de Twitter
              Tab(icon: Image.asset("assets/images/google.png")), // Opción de Google
            ],
          )
        ],
      ),
    );
  }
}