import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart'; 
import 'orders_screen.dart'; 

class AccountScreen extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeNotifier; 

  AccountScreen({required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, 
        title: Text("Account"),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, 
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: Theme.of(context).cardColor, 
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('lib/images/profilee.jpg'), 
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Althaf Azwer',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge?.color, 
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'althafazwer@gmail.com', 
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                    },
                    icon: Icon(Icons.edit, color: Colors.green),
                  ),
                ],
              ),
            ),

            
            ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.green),
              title: Text('Orders', style: GoogleFonts.roboto(fontSize: 16)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdersScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.green),
              title: Text('My Details', style: GoogleFonts.roboto(fontSize: 16)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.green),
              title: Text('Delivery Address', style: GoogleFonts.roboto(fontSize: 16)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.credit_card, color: Colors.green),
              title: Text('Payment Methods', style: GoogleFonts.roboto(fontSize: 16)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer, color: Colors.green),
              title: Text('Promo Code', style: GoogleFonts.roboto(fontSize: 16)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.green),
              title: Text('Notifications', style: GoogleFonts.roboto(fontSize: 16)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.help, color: Colors.green),
              title: Text('Help', style: GoogleFonts.roboto(fontSize: 16)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.green),
              title: Text('About', style: GoogleFonts.roboto(fontSize: 16)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
              },
            ),

            
            ListTile(
              leading: Icon(Icons.brightness_6, color: Colors.green),
              title: Text('Toggle Theme', style: GoogleFonts.roboto(fontSize: 16)),
              trailing: Switch(
                value: themeNotifier.value == ThemeMode.dark,
                onChanged: (value) {
                  themeNotifier.value =
                      value ? ThemeMode.dark : ThemeMode.light;
                },
              ),
            ),

            
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(themeNotifier: themeNotifier),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Log Out',
                      style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30), 
          ],
        ),
      ),
    );
  }
}
