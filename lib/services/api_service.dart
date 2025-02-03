import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart'; // Import the Product model
class ApiService {
  // Adjust the baseURL according to your environment:
  // For a local server on a desktop, http://127.0.0.1:8000/api works.
  // For Android emulator use: http://10.0.2.2:8000/api
  final String baseURL = 'http://10.0.2.2:8000/api';


  // Create an instance of FlutterSecureStorage for storing the token securely.
  final storage = const FlutterSecureStorage();

  /// Register a new user.
  ///
  /// Sends a POST request to {baseURL}/register with the user's details.
  /// Expects a 201 status code and returns the JSON response.
  Future<Map<String, dynamic>> registerUser(String name, String email, String password) async {
    final url = Uri.parse('$baseURL/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register user. Code: ${response.statusCode}');
    }
  }

  /// Log in a user.
  ///
  /// Sends a POST request to {baseURL}/login with email and password.
  /// Expects a 200 status code and returns the JSON response.
  /// The access token is saved securely.
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    final url = Uri.parse('$baseURL/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Save the token securely for future requests.
      await storage.write(key: 'token', value: data['token']);
      return data; // Expected format: { "user": {...}, "token": "..." }
    } else {
      throw Exception('Login failed. Code: ${response.statusCode}');
    }
  }

  /// Fetch authenticated user data.
  ///
  /// Sends a GET request to {baseURL}/user using the stored token.
  /// Expects a 200 status code and returns the JSON response.
  Future<Map<String, dynamic>> getUserData() async {
    final token = await storage.read(key: 'token');
    if (token == null) throw Exception('No token found');

    final url = Uri.parse('$baseURL/user');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to fetch user data. Code: ${response.statusCode}');
    }
  }

  /// Log out the user.
  ///
  /// Sends a POST request to {baseURL}/logout using the stored token.
  /// Expects a 200 status code, then removes the token from secure storage.
  Future<void> logoutUser() async {
    final token = await storage.read(key: 'token');
    if (token == null) return; // User already logged out.

    final url = Uri.parse('$baseURL/logout');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 401) {
      // Remove the token from secure storage.
      await storage.delete(key: 'token');
    } else {
      throw Exception('Logout failed. Code: ${response.statusCode}');
    }
  }

/// Fetch products from the Laravel API.
  Future<List<Product>> fetchProducts() async {
    final url = Uri.parse('$baseURL/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> productJson = jsonDecode(response.body);
      return productJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch products. Code: ${response.statusCode}');
    }
  }

}
