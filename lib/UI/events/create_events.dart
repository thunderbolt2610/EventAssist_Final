import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common/theme_helper.dart';
import '../profile_page.dart';
import '../widgets/header_widget.dart';

class CreateEvents extends StatefulWidget {
  const CreateEvents({Key? key}) : super(key: key);

  @override
  State<CreateEvents> createState() => _CreateEventsState();
}

class _CreateEventsState extends State<CreateEvents> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String? event_name;
  String? event_date;
  String? event_time;
  String? location;
  String? desc;
  String? end_time;
  String sv="Gargi Plaza";
  var colnames=["Auditorium","Labs","Seminar Hall","Classrooms","Gargi Plaza"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Event Name', 'Enter your event name'),
                            onSaved: (value) {
                              event_name = value!;
                              print(event_name);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          width: 300,
                          height: 50,

                          child: DropdownButton(
                            dropdownColor: Colors.white,
                            underline: Container(),
                            // Initial Value
                            value: sv,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,

                            // Array list of items
                            items: colnames.map((String colnames) {
                              return DropdownMenuItem(
                                value: colnames,
                                child: Text(colnames),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                sv = newValue!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Event Date', 'Enter your event date'),
                            onSaved: (value) {
                              event_date = value!;
                              print(event_date);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Event Date';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration("Enter start time of event", "Enter start time"),
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                               event_time = value!;
                              print(event_time);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter start time of event';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  "Enter end time",
                                  "Enter end time of time"),
                              keyboardType: TextInputType.phone,
                              onSaved: (value) {
                                end_time = value;
                                print(end_time);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter end time';
                                }
                                return null;
                              }
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  "Enter event description",
                                  "Description"),
                              keyboardType: TextInputType.phone,
                              onSaved: (value) {
                                end_time = value;
                                print(end_time);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter end time';
                                }
                                return null;
                              }
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text("Registered Successfully"))));
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => ProfilePage(email_add: FirebaseAuth.instance.currentUser!.email.toString(),)
                                      ),(Route<dynamic> route) => false);
                                }
                              }
    ))
    ]
    )
    )
    ]
    )
    )
    ]
    )
    )
    );
}}
