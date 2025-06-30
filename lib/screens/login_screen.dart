import 'package:animalitos_ui/providers/authentication_user.dart';
import 'package:animalitos_ui/utilities/messages_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 800;

    return Scaffold(
      body: isWide
          ? Row(
              children: [
                // Left: Login form
                Expanded(
                  flex: 2,
                  child: _buildForm(context, size),
                ),
                // Right: Blue background
                Expanded(
                  flex: 2,
                  child: Container(color: const Color(0xFF4A90E2)),
                ),
              ],
            )
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: _buildForm(context, size),
                ),
              ),
            ),
    );
  }

  Widget _buildForm(BuildContext context, Size size) {
    AuthProvider watch = context.watch<AuthProvider>();
    
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/logo.png', height: 64),
            const SizedBox(height: 24),
            const Text(
              'Inicia sesión con tu cuenta',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Bienvenido al sistema de Animalitos Pharma',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 32),

            // Username
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),

            // Password
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Contraseña',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 12),

            // Remember me
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (val) => setState(() => rememberMe = val!),
                ),
                const Text('Recordarme'),
              ],
            ),
            const SizedBox(height: 16),

            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if(_usernameController.text.isEmpty || _passController.text.isEmpty){
                    MessagesHelper.showError(context, "Rellena todos los campos");
                    return;
                  }
                  try {
                    await context.read<AuthProvider>().login(username: _usernameController.text, password: _passController.text);
                    if(!watch.isLogged){
                      MessagesHelper.showError(context, "Error al iniciar sesion");
                      return;
                    }
                    MessagesHelper.showSuccess(context, "Inicio de sesion correcto");
                    Navigator.pushReplacementNamed(context, '/home');
                  } catch (e) {
                    MessagesHelper.showError(context, "Error al iniciar sesion $e");
                  }
                },
                child: const Text('Iniciar sesión'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
