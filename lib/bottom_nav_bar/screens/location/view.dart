import 'package:flutter/material.dart';

import 'build_location_item.dart';
import 'model.dart';

class LocationView extends StatelessWidget {
  LocationView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset(
            "assets/icons/menu.png",
          ),
        ),
        centerTitle: true,
        title: const Text(
          "location",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      drawer: Drawer(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.cancel_outlined)],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/darwer_image.png')),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Kenneth Gutierrez',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Kenneth_gutierrez@gmail.com',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Notification',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blueAccent,
                            child: Icon(
                              Icons.airplanemode_active,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Tours',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.deepPurple,
                            child: Icon(
                              Icons.location_on_sharp,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Location',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue[900],
                            child: Icon(
                              Icons.language,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Language',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Invite Friends',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      Divider(
                        color: Color.fromRGBO(232, 232, 232, 100),
                        thickness: 2,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.yellow,
                            child: Icon(
                              Icons.headphones,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Help Center',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Setting',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.logout,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Log out',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 870,
                  width: size.height,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => BuildLocationItem(
                            locationItem: locationItem[index],
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                      itemCount: locationItem.length),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
