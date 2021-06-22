import 'package:assignment/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

enum ClassType { Gujarat, Maharashtra }

class _AddressScreenState extends State<AddressScreen> {
  String? _chosenValue;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.indigo[900],
        ),
        title: Center(
          child: Text(
            'Your Address',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Column(
              children: [
                CustomTextFormField(
                  inputType: TextInputType.text,
                  icon: Icons.location_city_outlined,
                  hint: 'Address',
                  validator: (value) {
                    if (value.isEmpty && value.length < 3) {
                      return 'Please Enter value';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  inputType: TextInputType.text,
                  icon: Icons.location_city_outlined,
                  hint: 'Landmark',
                  validator: (value) {
                    if (value.isEmpty && value.length < 3) {
                      return 'Please Enter value';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  inputType: TextInputType.text,
                  icon: Icons.location_city_outlined,
                  hint: 'City',
                  // validator: (value)=> validCharacters.validate(value)
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.indigo.shade900),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _chosenValue,
                      items: <String>[
                        '  Gujarat',
                        '  Maharashtra',
                        '  Karnataka',
                        '  MadhyaPradesh',
                        '  Delhi',
                        '  Others'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Please Select State",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _chosenValue = value.toString();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  inputType: TextInputType.number,
                  icon: Icons.location_city_outlined,
                  hint: 'Pin Code',
                  validator: (value) => validatePincode(value),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => InfoScreen()));

                      }
                      return null;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo[900],
                        side:
                            BorderSide(width: 2, color: Colors.indigo.shade900),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validatePincode(String value) {
    Pattern pattern = r'^[1-9][0-9]{5}$';
    RegExp regex = new RegExp(pattern.toString());
    print(value);
    if (value.isEmpty) {
      return 'Please enter Pincode';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid Pincode';
      else
        return null;
    }
  }
}
