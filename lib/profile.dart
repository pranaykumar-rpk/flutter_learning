import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Username'),
          leading: Icon(Icons.arrow_back_ios),
          actions: [Icon(Icons.menu)],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Colors.black),
              label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black), label: 'Profile'),
        ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30,
              children: [
                buildProfileImageAndData(),
                buildNameAndBio(),
                buildButtons(),
                buildTabs(),
                buildPosts()
              ],
            ),
          ),
        ));
  }

  Widget buildProfileImageAndData() {
    return Row(
      spacing: 30,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
              'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('115'),
                  Text('Posts'),
                ],
              ),
              Column(
                children: [
                  Text('115'),
                  Text('Posts'),
                ],
              ),
              Column(
                children: [
                  Text('115'),
                  Text('Posts'),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildNameAndBio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sample name',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          'bkjsbkfjbl beqkfjbjklblfnlnlknnlo bo;bg;jbl;jnlknl',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget buildButtons() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue),
                        child: Center(
                            child: Text(
                          'Follow',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                      ))),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                      child: Text(
                    'Message',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
                ),
              )),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
      ],
    );
  }

  Widget buildTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.home,
          size: 40,
        ),
        Icon(
          Icons.person,
          size: 40,
        ),
        Icon(
          Icons.access_alarm,
          size: 40,
        ),
      ],
    );
  }

  Widget buildPosts() {
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(
          10,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Column(
                      children: [
                        Text('12 Posts'),
                        Text('Mindful'),
                        Text('Text to'),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
