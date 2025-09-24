
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _userName = 'Guest';
  String _userEmail = '';
  bool _notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }


  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _userName = prefs.getString('userName') ?? 'Guest';
      _userEmail = prefs.getString('userEmail') ?? 'No email saved';
      _notificationsEnabled = prefs.getBool('userNotifications') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $_userName!'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Profile Details:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person_outline, size: 30),
                        title: Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(_userName, style: TextStyle(fontSize: 16)),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.email_outlined, size: 30),
                        title: Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(_userEmail, style: TextStyle(fontSize: 16)),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(
                          _notificationsEnabled ? Icons.notifications_active_outlined : Icons.notifications_off_outlined,
                          size: 30,
                          color: _notificationsEnabled ? Colors.blue : Colors.grey,
                        ),
                        title: Text('Notification', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          'Notifications are ${_notificationsEnabled ? "Enabled" : "Disabled"}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}