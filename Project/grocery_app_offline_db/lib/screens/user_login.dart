import 'package:flutter/material.dart';
import 'package:grocery_app_offline_db/screens/grocery_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {

  final _formKey = GlobalKey<FormState>();

  var _enteredName = '';

  @override
  void initState() {
    _checkLogin();
    super.initState();
  }

  void _checkLogin() async {
                                                    // read value from shared preference
    final sharedPref = SharedPreferencesAsync();
    final isLogin = await sharedPref.getBool("isLogin");

    if(isLogin!){
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (ctx) => GroceryList()));
    }
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final sharedPref = SharedPreferencesAsync();
      await sharedPref.setBool("isLogin", true);
      await sharedPref.setString("username", _enteredName);

      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (ctx) => GroceryList()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Here")),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(label: const Text("Username")),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return "Must be between 1 and 50 characters.";
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(label: const Text("Password")),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return "Must be between 1 and 50 characters.";
                  }
                  return null;
                },
                onSaved: (value) {
                  // _enteredName = value!;
                },
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: Text("Reset"),
                  ),
                  ElevatedButton(onPressed: _login, child: Text("Login")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
