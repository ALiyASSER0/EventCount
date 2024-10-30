import 'package:event_count_downar/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({super.key});

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  var currentPage = DrawerSection.theme;
  final String appLink = 'https://drive.google.com/drive/folders/1hNmW9D6EwwKWtEWwEJnYGqnmgjFvSnTf?usp=sharing';

  void shareAppLink() {
    Share.share('Check out this app: $appLink');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          menuItem(1, "المظهر", Icons.palette,
              currentPage == DrawerSection.theme ? true : false),
          menuItem(2, "عن التطبيق", Icons.info,
              currentPage == DrawerSection.info ? true : false),
          menuItem(3, "شارك مع صديق", Icons.share,
              currentPage == DrawerSection.share ? true : false),
          menuItem(4, "الدعم",Icons.support_agent,
              currentPage == DrawerSection.support ? true : false),    
        const Spacer(),
          const Divider(),
        const ListTile(
          leading:  Image(
                  image: AssetImage("assets/images/black-logo.png"),
                  height: 50,
                  width: 50,
                ),
          title: Text("EventTick"),
          subtitle: Text("version 1.0.0"),
        )
        ],
      ),
    );
  }

Widget menuItem(int id, String title, IconData icon, bool selected) {
  return Card(
    color: selected ? Colors.blue : Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    child: SizedBox(
      height: 60, 
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSection.theme;
              Navigator.pushNamed(context, Routes.myTheme);
            } else if (id == 2) {
              currentPage = DrawerSection.info;
                Navigator.pushNamed(context, Routes.aboutApp);
            } else if (id == 3) {
              currentPage = DrawerSection.share;
shareAppLink();
            }
            else if (id == 4) {
              currentPage = DrawerSection.support;
                 Navigator.pushNamed(context, Routes.feedback);
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12), 
          child: Row(
            children: [
              Icon(icon, size: 24, color:selected ? Colors.white : Colors.black),
              const Spacer(),
              Text(
                title,
                style: TextStyle(color: selected ? Colors.white : Colors.black, fontSize: 16),
              ),
                const SizedBox(
                  width:10
                  )
            ],
          ),
        ),
      ),
    ),
  );
}

}

enum DrawerSection { theme, info, share,support }
