import 'dart:ui';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  Future<void> login() async {
    var url = Uri.parse('http://202.28.34.207/api2/checklogin2.php');
    var data = {'email': _email.text, 'password': _password.text};
    var response = await http
        .post(url, body: convert.jsonEncode(data));
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);
      var message = jsonResponse['status'];
      print('message : $message.');
      if (message != 'login') {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('แจ้งเตือน'),
            content: const Text(
                'email หรือ password ไม่ถูกต้อง กรุณากรอกข้อมูลให้ถูกต้อง'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        Navigator.pushReplacementNamed(context, "/HomePage");
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

//--------------------------------

  void check_login() {
    if (_email.text.toString() == "admin" &&
        _password.text.toString() == "555") {
      Navigator.pushReplacementNamed(context, "/HomePage");
    } else {
      // ------------------------ Dialog ------------------------------
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('แจ้งเตือน'),
          content: const Text(
              'email หรือ password ไม่ถูกต้อง กรุณากรอกข้อมูลให้ถูกต้อง'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      // ------------------------ End Dialog ----------------------------
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight)),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 36.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ยินดีต้นรับเข้าสู่แอพพลิเคชั่น",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _email,
                              decoration: InputDecoration(
                                  hintText: "user@msu.ac.th",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  prefixIcon: Icon(
                                    Icons.email_rounded,
                                    color: Colors.grey[600],
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "abc123",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  prefixIcon: Icon(
                                    Icons.vpn_key_rounded,
                                    color: Colors.grey[600],
                                  )),
                            ),
                            SizedBox(height: 40),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 70,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    child: Text('Login'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blue[900],
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 50,
                                        vertical: 20,
                                      ),
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(20)),
                                    ),
                                    onPressed: login,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            OutlinedButton(
                              onPressed: () => {
                                Navigator.pushNamed(context, '/RegisterPage')
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0))),
                              ),
                              child: const Text("สมัครสมาชิก"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
