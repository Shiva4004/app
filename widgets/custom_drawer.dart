import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthService>(context).currentUser;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user?.username ?? 'User'),
            accountEmail: Text(user?.email ?? ''),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                user?.username.substring(0, 1).toUpperCase() ?? 'U',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () => Navigator.pushReplacementNamed(context, '/dashboard'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Customers'),
            onTap: () => Navigator.pushNamed(context, '/customers'),
          ),
          ListTile(
            leading: Icon(Icons.inventory),
            title: Text('Products'),
            onTap: () => Navigator.pushNamed(context, '/products'),
          ),
          ListTile(
            leading: Icon(Icons.point_of_sale),
            title: Text('POS'),
            onTap: () => Navigator.pushNamed(context, '/pos'),
          ),
          ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text('Orders'),
            onTap: () => Navigator.pushNamed(context, '/orders'),
          ),
          ListTile(
            leading: Icon(Icons.vpn_key),
            title: Text('License'),
            onTap: () => Navigator.pushNamed(context, '/license'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Provider.of<AuthService>(context, listen: false).logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
