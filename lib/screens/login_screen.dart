import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/api_service.dart';
import '../utils/validators.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const LoginScreen({Key? key, required this.themeNotifier}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Create an instance of the API service
  final ApiService _apiService = ApiService();

  // This function is called when the user taps the "Login" button.
  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Retrieve values from controllers
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      try {
        // Call the login API. This method saves the token securely if successful.
        final response = await _apiService.loginUser(email, password);
        // Print response for debugging (optional)
        print("Login successful: $response");

        // Navigate to HomeScreen upon successful login.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(themeNotifier: widget.themeNotifier),
          ),
        );
      } catch (error) {
        // Display error using a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isLargeScreen = screenWidth > 600;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.05,
          horizontal: screenWidth * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // App logo
            Center(
              child: Image.asset(
                'lib/images/logofinal.png',
                height: isLargeScreen ? 180 : 150,
                width: isLargeScreen ? 180 : 150,
              ),
            ),
            SizedBox(height: isLargeScreen ? 40 : 30),
            // Screen Title
            Text(
              'Login to your account',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: isLargeScreen ? 30 : 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: isLargeScreen ? 20 : 10),
            // Login Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Email Field
                  TextFormField(
                    controller: emailController,
                    style: GoogleFonts.roboto(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: isLargeScreen ? 20 : 16,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter email',
                      filled: true,
                      fillColor: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[200]
                          : Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: Validators.validateEmail,
                  ),
                  SizedBox(height: isLargeScreen ? 25 : 20),
                  // Password Field
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: GoogleFonts.roboto(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: isLargeScreen ? 20 : 16,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      filled: true,
                      fillColor: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[200]
                          : Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: Validators.validatePassword,
                  ),
                  SizedBox(height: isLargeScreen ? 20 : 10),
                  // Forgot Password Link (if needed)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // You can implement forgot password functionality here.
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.roboto(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.blueAccent
                              : Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: isLargeScreen ? 16 : 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: isLargeScreen ? 35 : 30),
                  // Login Button
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.green
                          : Colors.purple,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.roboto(
                        fontSize: isLargeScreen ? 20 : 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: isLargeScreen ? 25 : 20),
                  // Link to Registration Screen
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: GoogleFonts.roboto(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: isLargeScreen ? 16 : 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(themeNotifier: widget.themeNotifier),
                            ),
                          );
                        },
                        child: Text(
                          'Signup',
                          style: GoogleFonts.roboto(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.blueAccent
                                : Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: isLargeScreen ? 16 : 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
