import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, 
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, 
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Theme.of(context).cardColor, 
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                leading: Image.asset(
                  order['image'],
                  width: 60,
                  height: 60,
                ),
                title: Text(
                  order['status'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: order['statusColor'], 
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order ID: ${order['id']}',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color, 
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${order['date']}',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color, 
                      ),
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).iconTheme.color, 
                  size: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


final List<Map<String, dynamic>> orders = [
  {
    'id': '4544882266',
    'status': 'Processing',
    'date': 'Today',
    'image': 'lib/images/gocery.jpg',
    'statusColor': Colors.orange, 
  },
  {
    'id': '4544882267',
    'status': 'Delivered',
    'date': '20 Aug, 2020',
    'image': 'lib/images/gocery.jpg',
    'statusColor': Colors.green, 
  },
  {
    'id': '4544882267',
    'status': 'Cancelled',
    'date': '20 Aug, 2020',
    'image': 'lib/images/gocery.jpg',
    'statusColor': Colors.red, 
  },
];
