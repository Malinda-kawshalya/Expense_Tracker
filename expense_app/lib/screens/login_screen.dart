import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
    const LoginScreen({Key? key}) : super(key: key);

    @override
    _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    bool _isLoading = false;
    bool _obscurePassword = true;

    void _login() async {
        if (_formKey.currentState!.validate()) {
            setState(() {
                _isLoading = true;
            });

            // Simulating authentication delay
            await Future.delayed(const Duration(seconds: 2));

            // TODO: Implement actual authentication
            // Navigate to home screen after successful login
            if (!mounted) return;
            
            Navigator.pushReplacementNamed(context, '/home');

            setState(() {
                _isLoading = false;
            });
        }
    }

    @override
    void dispose() {
        _emailController.dispose();
        _passwordController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Center(
                        child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                    const Icon(
                                        Icons.account_balance_wallet,
                                        size: 80,
                                        color: Colors.blueAccent,
                                    ),
                                    const SizedBox(height: 24),
                                    const Text(
                                        'Expense Tracker',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                    const SizedBox(height: 48),
                                    Form(
                                        key: _formKey,
                                        child: Column(
                                            children: [
                                                TextFormField(
                                                    controller: _emailController,
                                                    keyboardType: TextInputType.emailAddress,
                                                    decoration: const InputDecoration(
                                                        labelText: 'Email',
                                                        prefixIcon: Icon(Icons.email),
                                                        border: OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                            return 'Please enter your email';
                                                        }
                                                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                                            return 'Please enter a valid email';
                                                        }
                                                        return null;
                                                    },
                                                ),
                                                const SizedBox(height: 16),
                                                TextFormField(
                                                    controller: _passwordController,
                                                    obscureText: _obscurePassword,
                                                    decoration: InputDecoration(
                                                        labelText: 'Password',
                                                        prefixIcon: const Icon(Icons.lock),
                                                        suffixIcon: IconButton(
                                                            icon: Icon(
                                                                _obscurePassword ? Icons.visibility : Icons.visibility_off,
                                                            ),
                                                            onPressed: () {
                                                                setState(() {
                                                                    _obscurePassword = !_obscurePassword;
                                                                });
                                                            },
                                                        ),
                                                        border: const OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                            return 'Please enter your password';
                                                        }
                                                        if (value.length < 6) {
                                                            return 'Password must be at least 6 characters';
                                                        }
                                                        return null;
                                                    },
                                                ),
                                                const SizedBox(height: 8),
                                                Align(
                                                    alignment: Alignment.centerRight,
                                                    child: TextButton(
                                                        onPressed: () {
                                                            // TODO: Implement forgot password
                                                        },
                                                        child: const Text('Forgot Password?'),
                                                    ),
                                                ),
                                                const SizedBox(height: 24),
                                                SizedBox(
                                                    width: double.infinity,
                                                    height: 50,
                                                    child: ElevatedButton(
                                                        onPressed: _isLoading ? null : _login,
                                                        style: ElevatedButton.styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(8),
                                                            ),
                                                        ),
                                                        child: _isLoading
                                                                ? const CircularProgressIndicator()
                                                                : const Text(
                                                                        'Login',
                                                                        style: TextStyle(fontSize: 16),
                                                                    ),
                                                    ),
                                                ),
                                                const SizedBox(height: 24),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                        const Text("Don't have an account?"),
                                                        TextButton(
                                                            onPressed: () {
                                                                // TODO: Navigate to registration screen
                                                                // Navigator.pushNamed(context, '/register');
                                                            },
                                                            child: const Text('Register'),
                                                        ),
                                                    ],
                                                ),
                                            ],
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ),
                ),
            ),
        );
    }
}