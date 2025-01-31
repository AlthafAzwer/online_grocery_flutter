import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/validators.dart'; 
import 'login_screen.dart'; 

class RegisterScreen extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  RegisterScreen({required this.themeNotifier});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';

  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print("Name: $_name");
      print("Email: $_email");
      print("Password: $_password");


      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(themeNotifier: widget.themeNotifier),
        ),
      );
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
            Center(
              child: Image.asset(
                'lib/images/logofinal.png', 
                height: isLargeScreen ? 180 : 150,  
                width: isLargeScreen ? 180 : 150,
              ),
            ),
            SizedBox(height: isLargeScreen ? 40 : 30), 

            
            Text(
              'Create Your Account',
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

          
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    style: GoogleFonts.roboto(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: isLargeScreen ? 20 : 16, 
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      filled: true,
                      fillColor: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[200]
                          : Colors.grey[800], 
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: Validators.validateName, 
                  ),
                  SizedBox(height: isLargeScreen ? 25 : 20),  

                  
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
                  SizedBox(height: isLargeScreen ? 35 : 30),  

                  
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
                      'Sign Up',
                      style: GoogleFonts.roboto(
                        fontSize: isLargeScreen ? 20 : 18,  
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: isLargeScreen ? 25 : 20),  

                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: GoogleFonts.roboto(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: isLargeScreen ? 16 : 14,  
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(themeNotifier: widget.themeNotifier),
                            ),
                          );
                        },
                        child: Text(
                          'Login',
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
