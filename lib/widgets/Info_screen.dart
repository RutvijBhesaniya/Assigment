import 'package:assignment/utils/common_widgets.dart';
import 'package:assignment/widgets/register_screen.dart';
import 'package:assignment/widgets/your_address.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String? _education;
  String? _passYear;
  String? _desig;
  String? _domain;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.indigo[900],
            ),
          ),
          title: Center(
            child: Text(
              'Your Address',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Educational Info',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      CustomLabelName(
                        text: 'Educational*',
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
                            value: _education,
                            items: <String>[
                              '  Graduate',
                              '  Post Graduate',
                              '  HSC/Diploma',
                              '  SSC',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Select Your Qualification",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _education = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      CustomLabelName(
                        text: 'Year of Passing*',
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
                            value: _passYear,
                            items: <String>[
                              '  2000',
                              '  2001',
                              '  2002',
                              '  2003',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Year of Passing",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _passYear = value.toString();
                              });
                            },
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      CustomLabelName(
                        text: 'Grade*',
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      CustomTextFormField(
                        inputType: TextInputType.text,
                        hint: 'Enter your Grade or Percentage',
                        icon: Icons.account_circle_outlined,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Professional Info',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomLabelName(
                        text: 'Experience*',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        inputType: TextInputType.number,
                        hint: 'Enter the year of experience',
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
                        text: 'Desigantion*',
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
                            value: _desig,
                            items: <String>[
                              '  Junior',
                              '  Senior',
                              '  Team Leader',
                              '  Project Manager',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Please Select State",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _desig = value.toString();
                              });
                            },
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      CustomLabelName(
                        text: 'Domain*',
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
                            value: _domain,
                            items: <String>[
                              '  Flutter',
                              '  Android',
                              '  Ios',
                              '  Php',
                              '  Magento',
                              '  Design'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Please Select State",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _domain = value.toString();
                              });
                            },
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 23, vertical: 15),
                              child: Text(
                                'Previous',
                                style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                side: BorderSide(
                                    width: 2, color: Colors.indigo.shade900),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddressScreen()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 15),
                              child: Text(
                                'Next',
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
                                    borderRadius: BorderRadius.circular(0))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )


                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
