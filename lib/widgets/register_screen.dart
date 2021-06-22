import 'dart:io';
import 'dart:ui';

import 'package:assignment/utils/common_widgets.dart';
import 'package:assignment/widgets/Info_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

enum Gender { male, female }

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  PickedFile? _imageFile;

  Gender? _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              'Register',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: _imagePicker()),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomLabelName(
                          text: 'First Name*',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          inputType: TextInputType.text,
                          hint: 'Enter your first name here',
                          icon: Icons.account_circle_outlined,
                          validator: (value) {
                            if (value.isEmpty || value.length < 3) {
                              return 'Please Enter value';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomLabelName(
                          text: 'Last Name*',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          inputType: TextInputType.text,
                          hint: 'Enter your last name here',
                          icon: Icons.account_circle_outlined,
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
                        CustomLabelName(
                          text: 'Phone Number*',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          inputType: TextInputType.number,
                          hint: 'Enter your 10 digit phone number',
                          icon: Icons.account_circle_outlined,
                          validator: (value) {
                            if (value.isEmpty && value.length < 10) {
                              return 'Please Enter 10 digits';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomLabelName(
                          text: 'Email*',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          inputType: TextInputType.emailAddress,
                          hint: 'Your email goes here',
                          icon: Icons.account_circle_outlined,
                          validator: (value) => EmailValidator.validate(value)
                              ? null
                              : 'Please Enter valid Email',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomLabelName(
                          text: 'Gender',
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: ListTile(
                                title: Text(
                                  'Male',
                                ),
                                leading: Radio<Gender>(
                                  value: Gender.male,
                                  groupValue: _gender,
                                  onChanged: (Gender? value) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: ListTile(
                                title: Text(
                                  'Female',
                                ),
                                leading: Radio<Gender>(
                                  value: Gender.female,
                                  groupValue: _gender,
                                  onChanged: (Gender? value) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomLabelName(
                          text: 'Password*',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          controller: _pass,
                          inputType: TextInputType.text,
                          hint: 'Password',
                          icon: Icons.shopping_bag_outlined,
                          validator: (value) => validatePassword(value),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomLabelName(
                          text: 'Confirm Password',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          controller: _confirmPass,
                          inputType: TextInputType.text,
                          hint: 'Password',
                          icon: Icons.shopping_bag_outlined,
                          validator: (value) {
                            if (value.isEmpty) return 'Please enter password';
                            if (value != _pass.text)
                              return 'Password does not match';
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InfoScreen()));
                              }
                              return null;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: Text(
                                'NEXT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo[900],
                              side: BorderSide(
                                  width: 2, color: Colors.indigo.shade900),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _imagePicker() {
    return Stack(
      children: [
        CircleAvatar(
            radius: 40,
            backgroundImage: _imageFile == null
                ? AssetImage("assets/images/audi.jpg")
                : FileImage(File(_imageFile!.path)) as ImageProvider),
        Positioned(
          bottom: 10,
          right: 10,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: ((builder) => bottomSheet()));
            },
            child: Icon(Icons.camera_alt_outlined),
          ),
        )
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose Profile photo',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera_alt_outlined),
                label: Text('Camera'),
              ),
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.camera_alt_outlined),
                label: Text('Gallary'),
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile!;
    });
  }

  String? validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern.toString());
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid password';
      else
        return null;
    }
  }
// bool validateStructure(String value) {
//   String pattern =
//       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//   RegExp regExp = new RegExp(pattern);
//   return regExp.hasMatch(value);
// }
}
