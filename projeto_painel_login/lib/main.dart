// Importa o pacote principal do Flutter para construção da interface
import 'package:flutter/material.dart';

// Função principal que inicia o app
void main() {
  runApp(MyApp());
}

// Classe principal do aplicativo, é um widget sem estado (StatelessWidget)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Bonito',               // Título do app
      debugShowCheckedModeBanner: false,  // Remove a faixa de debug do canto superior direito
      home: LoginScreen(),                // Define a tela inicial como a de login
    );
  }
}

// Tela de login (widget com estado)
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// Estado da tela de login
class _LoginScreenState extends State<LoginScreen> {
  // Controladores para ler o conteúdo digitado nos campos de email e senha
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  // Controla se a senha será exibida ou ocultada
  bool _obscurePassword = true;

  // Verifica se ambos os campos estão preenchidos
  bool get _isFormValid =>
      _emailController.text.isNotEmpty && _senhaController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estrutura da tela
      body: Container(
        // Fundo com gradiente roxo e azul
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6D0EB5), Color(0xFF4059F1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Card(
              // Cartão branco com cantos arredondados
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10, // Sombra do card
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400), // Limita largura do card
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Ícone no topo
                      const Icon(Icons.lock_outline, size: 60, color: Colors.deepPurple),
                      const SizedBox(height: 20),
                      const Text(
                        'Bem-vindo!',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),

                      // Campo de email
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (_) => setState(() {}), // Atualiza botão
                      ),
                      const SizedBox(height: 15),

                      // Campo de senha
                      TextField(
                        controller: _senhaController,
                        obscureText: _obscurePassword, // Esconde/mostra senha
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          labelText: 'Senha',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 20),

                      // Botão de login
                      ElevatedButton(
                        onPressed: _isFormValid
                            ? () {
                          // Mostra uma mensagem temporária (Snackbar)
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login realizado!')),
                          );
                        }
                            : null, // Desativa botão se o formulário estiver incompleto
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Botão de cadastro
                      TextButton(
                        onPressed: () {
                          // Vai para a tela de cadastro
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => CadastroScreen()),
                          );
                        },
                        child: const Text(
                          'Cadastrar-se',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Tela de Cadastro de novo usuário
class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  // Controladores dos campos de nome, email e senha
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _obscurePassword = true;

  // Verifica se todos os campos foram preenchidos
  bool get _isFormValid =>
      _nomeController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _senhaController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fundo com gradiente (cores invertidas da tela de login)
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4059F1), Color(0xFF6D0EB5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Ícone de cadastro
                      const Icon(Icons.person_add_alt_1, size: 60, color: Colors.deepPurple),
                      const SizedBox(height: 20),
                      const Text(
                        'Crie sua conta',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),

                      // Campo Nome
                      TextField(
                        controller: _nomeController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Nome completo',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 15),

                      // Campo Email
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 15),

                      // Campo Senha
                      TextField(
                        controller: _senhaController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          labelText: 'Senha',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 20),

                      // Botão "Cadastrar"
                      ElevatedButton(
                        onPressed: _isFormValid
                            ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Cadastro realizado!')),
                          );
                        }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Botão para voltar à tela de login
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Voltar para o login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
