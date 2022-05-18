import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
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
                  colors: [Colors.deepPurple, Colors.blue],
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
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 30,
                            ),
                            color: Colors.white,
                            tooltip: '',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ยินดีต้นรับสมาชิกใหม่",
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
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  hintText: "Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  prefixIcon: Icon(
                                    Icons.person_pin_rounded,
                                    color: Colors.grey[600],
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: "Email",
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
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
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
                                    child: Text('Register'),
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
                                    onPressed: () => {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('แจ้งเตือน'),
          content: const Text(
              'ระบบยังไม่รองรับการสมครสมาชิกในขณะนี้'),
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
      )
                                    },
                                  ),
                                ],
                              ),
                            ),
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
