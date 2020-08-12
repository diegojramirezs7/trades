import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //build method returns widget that specifies what to display
  @override
  Widget build(BuildContext context) {
    final appBarTitle = Text('Edit Profile', style: TextStyle(color: Colors.black),);
    return MaterialApp(
      title: 'TradePros',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: appBarTitle,
          ),
          backgroundColor: Color.fromRGBO(200, 200, 200, 1.0),
        ),
        body: Column(
          children: [
            headerSection,
            EditProfileForm(),
            changePasswordButton,
          ],
        ),
      ),
    );
  }
}

Widget headerSection = Container(
  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Account Settings',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget formFieldRow = Row(
  children: [
    Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Text(
            "First Name",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'post_man_tradepro_jun_10',
              ),
            ),
          ),
        ],
      ),
    ),
  ],
);



BoxDecoration formFieldDecoration(){
  return BoxDecoration(
    border: Border.all(
      width: 1,
      color: Colors.grey,
    ),
  );
}



class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _firstNameField = "some value";
  final _lastNameField = "some other value";
  final _textFieldStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: formFieldDecoration(),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                      child: Text(
                        "First Name",
                        style: _textFieldStyle,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'post_man_tradepro_jun_10',
                          ),
                          textAlign: TextAlign.right,
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: formFieldDecoration(),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                      child: Text(
                        "Last Name",
                        style: _textFieldStyle,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'post_man_test_last_name_jun_10',
                          ),
                          textAlign: TextAlign.right,
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget changePasswordButton = Container(
  margin: EdgeInsets.only(top: 20),
  child: RaisedButton(
    onPressed: () {},
    textColor: Colors.black,
    padding: const EdgeInsets.all(0.0),
    child: Container(
      decoration: const BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius:  BorderRadius.all(Radius.elliptical(5.0, 5.0)),
      ),
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      child: const Text('Change Password ?', style: TextStyle(fontSize: 20)),
    ),
  ),
);