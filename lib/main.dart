import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:js' as js;

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//     );
//   }
// }
class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final double profileHeight = 144;
  final double coverHeight = 280;

  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            // onTap: (value) => {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => const chat()))
            //     },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chat',
                  backgroundColor: Colors.blue),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.blue),
            ]),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            buildTop(),
            buildContent(),
          ],
        ));
  }

  Widget buildContent() => Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            'Lighning Macqueen',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '4 times piston cup champion',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(FontAwesomeIcons.slack),
              const SizedBox(
                width: 12,
              ),
              buildSocialIcon(FontAwesomeIcons.github),
              const SizedBox(
                width: 12,
              ),
              buildSocialIcon(FontAwesomeIcons.twitter),
              const SizedBox(
                width: 12,
              ),
              buildSocialIcon(FontAwesomeIcons.linkedin),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Divider(),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Followers\n25M',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(
                width: 12,
              ),
              Text(
                'Following\n253',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                'Post\n22',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            'About',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '4 times piston cup championawesxrtfgvybhjnbgyftrdesrtfghjnim drtfgyhunjim ertfgyhuij rtfghyuji im drtfgyhunjim ertfgyhuij rtfghyuji im drtfgyhunjim ertfgyhuij rtfghyuji im drtfgyhunjim ertfgyhuij rtfghyuji im drtfgyhunjim ertfgyhuij rtfghyuji im drtfgyhunjim ertfgyhuij rtfghyuji im drtfgyhunjim ertfgyhuij rtfghyuji im drtfgyhunjim ertfgyhuij rtfghyujik',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ],
      );

  Widget buildTop() {
    final top = profileHeight + 50;
    final bottom = coverHeight - profileHeight;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://images.squarespace-cdn.com/content/v1/51cdafc4e4b09eb676a64e68/1470951916924-P0W0ABM165Q2JLRP7MMC/McQueen14.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: NetworkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrHmP0x6rRB0apanRI3N0YOLPDdgY-oB1hmQ&usqp=CAU',
      ));

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
      radius: 25,
      child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              js.context.callMethod('open',
                  ['https://github.com/arpitgits/Lab_Evalution2/issues']);
              // https://github.com/arpitgits/Lab_Evalution2/issues
            },
            child: Center(child: Icon(icon, size: 32)),
          )));
}
