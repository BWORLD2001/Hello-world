import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forms/dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final butty = GlobalKey<FormState>();
  TextEditingController fname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pnum = TextEditingController();
  TextEditingController pass = TextEditingController();
  final _key = GlobalKey<ScaffoldState>();
  bool isopen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: butty,
              child: Column(children: [
                Image.asset(
                  'assets/web.jpg',
                  width: 400,
                  height: 200,
                ),
                TextFormField(
                  controller: fname,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey,
                    prefixIcon: Icon(Icons.people),
                    labelText: 'Fullname',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.length < 10) {
                      return 'Full name is required';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: email,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey,
                  ),
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Email can not be less than 6 characters';
                    } else if (!value.contains('@')) {
                      return 'Email must contain keyword "@"';
                    } else if (!value.contains('.com')) {
                      return 'Email must contain keyword "."';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  controller: pnum,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey,
                  ),
                  validator: (value) {
                    if (value!.length > 11) {
                      return 'Phone Number must be 11 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // obscureText:isopen,
                  controller: pass,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isopen = !isopen;
                            });
                          },
                          icon: isopen
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey,
                      labelText: 'Password',
                      hintText: "********"),
                  obscureText: isopen,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'password cannot be less than 6 character';
                    } else if (!value.contains('!')) {
                      return 'add key world "!"';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    if (butty.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => MyDashboard(fname: fname.text, phn: pnum.text, email: email.text)));
                      // debugPrint(email.text);
                      // debugPrint(pnum.text);
                      // debugPrint(fname.text);
                      // debugPrint(pass.text);
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.blue,
                  child: Text(
                    "validate me",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    email = TextEditingController();
    fname = TextEditingController();
    pnum = TextEditingController();
    pass = TextEditingController();
    ;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    fname.dispose();
    fname.dispose();
    pnum.dispose();
    super.dispose();
  }
}
