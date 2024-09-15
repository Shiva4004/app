import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'Dashboard'),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${authService.currentUser?.username ?? "User"}!',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 24.0),
            _buildQuickActions(context),
            SizedBox(height: 24.0),
            _buildSummaryCards(context),
            SizedBox(height: 24.0),
            _buildRecentActivity(context),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildActionButton(context, 'New Sale', Icons.point_of_sale, () {
              Navigator.pushNamed(context, '/pos');
            }),
            _buildActionButton(context, 'Add Customer', Icons.person_add, () {
              Navigator.pushNamed(context, '/crm');
            }),
            _buildActionButton(context, 'View Reports', Icons.bar_chart, () {
              Navigator.pushNamed(context, '/reports');
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, String label, IconData icon,
      VoidCallback onPressed) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: Icon(icon, size: 32.0),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(16.0),
          ),
        ),
        SizedBox(height: 8.0),
        Text(label),
      ],
    );
  }

  Widget _buildSummaryCards(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Summary',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                  context, 'Today\'s Sales', '\$1,234.56', Icons.attach_money),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: _buildSummaryCard(
                  context, 'New Customers', '5', Icons.group_add),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                  context, 'Low Stock Items', '3', Icons.warning),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: _buildSummaryCard(
                  context, 'Pending Orders', '2', Icons.pending_actions),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryCard(
      BuildContext context, String title, String value, IconData icon) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.subtitle1),
                Icon(icon, color: Theme.of(context).primaryColor),
              ],
            ),
            SizedBox(height: 8.0),
            Text(value, style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 16.0),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.history),
              title: Text('Activity ${index + 1}'),
              subtitle: Text('Description of activity ${index + 1}'),
              trailing: Text('2h ago'),
            );
          },
        ),
      ],
    );
  }
}
