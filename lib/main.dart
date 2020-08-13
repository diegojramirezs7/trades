import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        // app bar wit title, back button and save button
        // buttons don't do anything yet.
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
            color: Colors.black,
          ),
          title: Center(
            child: appBarTitle,
          ),
          actions: [
            FlatButton(
              onPressed: () {},
              textColor: Colors.black,
              padding: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              child: Container(
                child:
                const Text('Save', style: TextStyle(fontSize: 20, fontFamily: "Open Sans")),
              ),
            ),
          ],
          backgroundColor: Color.fromRGBO(230, 230, 230, 1.0),
        ),
        body: Column(
          children: [
            headerSection,
            //this widget contains textFields, dropdown and button.
            EditProfileForm(),
          ],
        ),
      ),
    );
  }
}

// displays subheader "Account Settings", wrapped in other Widgets for better structure
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


//stateful component that has dropdown, text fields and change password button
class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  String _firstNameField = "";
  String _lastNameField = "";

  String _dropdownValue = "Canada";

  bool _buttonActive() {
    return _dropdownValue == "Canada";
  }

  //predefined style for text fields
  final _textFieldStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  //predefined decoration for whole row in the form
  BoxDecoration _formFieldDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 0.5,
        color: Color.fromRGBO(200, 200, 200, 0.5),
      ),
      color: Colors.white,
    );
  }

  //text field builder, takes label and hint text as args.
  //any field can use this builder method to get a uniform look on all text fields
  Container _buildTextFieldContainer(String label, String hintTextArg) {
    return Container(
      decoration: _formFieldDecoration(),
      child: Row(
        children: [
          // column wrapping the text field label
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
          // Text field wrapped by expanded and column to have it take the rest of the row
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: hintTextArg),
                    textAlign: TextAlign.right,
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

  //builds dropdown list
  Container _buildDropdownContainer() {
    return Container(
      decoration: _formFieldDecoration(),
      child: Row(
        children: [
          //label indicating what to select
          Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                child: Text(
                  "Country",
                  style: _textFieldStyle,
                ),
              ),
            ],
          ),
          //actual dropdown wrapped in other Widgets for a more structured layout
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Center(
                    child: DropdownButton<String>(
                      //initial value set to Canada
                      value: _dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 16,
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      //update dropdown value
                      onChanged: (String newValue) {
                        setState(() {
                          _dropdownValue = newValue;
                        });
                      },
                      //list of Country strings, mapped to DropDownMenuItem
                      items: <String>['Canada', 'USA', 'England']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(fontSize: 16),),
                        );
                      }).toList(),
                    ),
                  ),
                  padding: const EdgeInsets.all(0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // called when Change password button is pressed, can be modified to something more meaningful
  void buttonPressed() {
    print("Button Pressed");
  }

  //builder method returns change password button
  Container _buildChangePasswordButton() {
    //button is enabled only when Canada is selected in dropdown list
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
              const Text('Change Password ?', style: TextStyle(fontSize: 20, fontFamily: "Open Sans")),
        ),
      ),
    );
  }

  //Form build method calls other builder methods to create text fields, dropdown and button
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          _buildTextFieldContainer("First Name", "post_man_tradepro_jun_10"),
          _buildTextFieldContainer("Last Name", "post_man_test_last_name_jun_10"),
          _buildTextFieldContainer("Email", "youremail@example.com"),
          _buildDropdownContainer(),
          _buildChangePasswordButton(),
        ],
      ),
    );
  }
}
