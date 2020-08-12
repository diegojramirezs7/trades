import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //build method returns widget that specifies what to display
  @override
  Widget build(BuildContext context) {
    final appBarTitle = Text(
      'Edit Profile',
      style: TextStyle(color: Colors.black),
    );
    return MaterialApp(
      title: 'TradePros',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(230, 230, 230, 1.0),
        appBar: AppBar(
          title: Center(
            child: appBarTitle,
          ),
          backgroundColor: Color.fromRGBO(230, 230, 230, 1.0),
        ),
        body: Column(
          children: [
            headerSection,
            EditProfileForm(),
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

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  String _firstNameField = "";
  String _lastNameField = "";

  String _dropdownValue = "Canada";

  bool _buttonActive(){
    return _dropdownValue == "Canada";
  }

  // final myController = TextEditingController();

//  @override
//  void dispose() {
//    // Clean up the controller when the widget is disposed.
//    myController.dispose();
//    super.dispose();
//  }

  final _textFieldStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  BoxDecoration _formFieldDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 0.5,
        color: Color.fromRGBO(200, 200, 200, 0.5),
      ),
      color: Colors.white,
    );
  }

  Container _buildTextFieldContainer(String label, String hintTextArg) {
    return Container(
      decoration: _formFieldDecoration(),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                child: Text(
                  label,
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
                        border: InputBorder.none, hintText: hintTextArg),
                    textAlign: TextAlign.right,
                    //controller: myController,
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountryDropDown() {
    return Container(
      decoration: _formFieldDecoration(),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Center(
        child: DropdownButton<String>(
          value: _dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 16,
          underline: Container(
            height: 2,
            color: Colors.white,
          ),
          onChanged: (String newValue) {
            setState(() {
              _dropdownValue = newValue;
            });
          },
          items: <String>['Canada', 'USA', 'England']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  void buttonPressed(){
    print("hello");
  }

  Container _buildChangePasswordButton() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: FlatButton(
        disabledColor: Color.fromRGBO(170, 170, 170, 0.7),
        onPressed: _buttonActive() ? buttonPressed : null,
        textColor: Colors.black,
        padding: const EdgeInsets.all(0.0),
        color: Colors.orangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
          child:
              const Text('Change Password ?', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextFieldContainer("First Name", "post_man_tradepro_jun_10"),
          _buildTextFieldContainer("Last Name", "post_man_test_last_name_jun_10"),
          _buildCountryDropDown(),
          _buildChangePasswordButton(),
        ],
      ),
    );
  }
}
