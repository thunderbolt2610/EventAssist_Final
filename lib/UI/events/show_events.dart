import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:testing/UI/events/add_events.dart";
import "package:testing/UI/events/event_details.dart";

import "../../common/theme_helper.dart";
import "../login_page.dart";
import "../profile_page.dart";

class ShowEvents extends StatefulWidget {
const ShowEvents({Key? key}) : super(key: key);

@override
State<ShowEvents> createState() => _ShowEventsState();
}

class _ShowEventsState extends State<ShowEvents> {
  final double  _drawerIconSize = 24;
  final double _drawerFontSize = 17;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _handleSignOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text("Logout Successfully"))));
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Event Display"),
      centerTitle: true,
    ),
      drawer: Drawer(
        child: Container(
          decoration:BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.0, 1.0],
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  ]
              )
          ) ,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 1.0],
                    colors: [ Theme.of(context).primaryColor,Theme.of(context).colorScheme.secondary,],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text("Nav Bar",
                    style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Divider(color: Theme.of(context).primaryColor, height: 1,),

              ListTile(
                leading: Icon(Icons.event, size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary,),
                title: Text('Add Events',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEvents()));
                },
              ),

              Divider(color: Theme.of(context).primaryColor, height: 1,),

              ListTile(
                leading: Icon(Icons.event, size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary,),
                title: Text('Events',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ShowEvents()));
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),

              ListTile(
                leading: Icon(Icons.verified_user_sharp, size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary,),
                title: Text('Profile',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => const ProfilePage(email_add: "kunal29@somaiya.edu",)));
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary,),
                title: Text('Logout',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  _handleSignOut(context);
                },
              ),
            ],
          ),
        ),
      ),
    body: ListView.builder(
      itemCount: 3,
      itemBuilder:(context,index) {
        return Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            //color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*InkWell(
                  onTap: () {
                    //Get.back();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 20),
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/images/ebg.jpeg',
                    ),
                  ),
                ),*/
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/ebg.jpeg',
                          ),
                          radius: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Club Name',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const EventDetails()));
                      },
                      child: Container(
                        height: 190,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/ebg.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Event Name",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150,25),
                            backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('Register'.toUpperCase(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                          ),
                          onPressed: (){
                            showDialog(context: context, builder: (BuildContext context){
                              return AlertDialog(
                                backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                title: const Text("Are you sure you want to register?",style: TextStyle(
                                  color: Colors.white
                                ),),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          onPressed: ()
                                          {
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                backgroundColor: Colors.black,
                                                content: Text("Registered Successfully",style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20
                                                ),)));

                                        
                                      }, child: const Text("Yes")),
                                      ElevatedButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: const Text("No"))
                                    ],
                                  ),
                                ],
                              );
                            });
                            //After successful login we will redirect to profile page. Let's create profile page now
                            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShowEvents()));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    /*Row(
                  children: [
                    Image.asset(
                      'assets/images/ebg.jpeg',
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),*/
                  ]
              ),
            ),
          ),
        );
      }
    )
  );
}
}
