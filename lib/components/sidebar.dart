import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sidebarx/sidebarx.dart';
import '../pages/dashboard_page.dart';
import '../main.dart';

class Sidebar extends StatefulWidget {
  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: RootPage.sidebarController,
      animationDuration: Duration(seconds: 0),
      items: [
        SidebarXItem(
          iconWidget: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 15),
                    child: Icon(
                      //Make Icons.person a user image
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Pablo\nPicasso",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              //TODO Fix why divider is not showing up
              Divider(
                color: Colors.grey,
                thickness: 5,
              ),
            ],
          ),
        ),
        SidebarXItem(
          icon: Icons.map_outlined,
          label: 'Muscle Map',
          onTap: () {
            context.push('/muscleMap');
          },
        ),
        SidebarXItem(
          icon: FontAwesomeIcons.circleInfo,
          label: 'About',
          onTap: (() {
            context.push('/about');
          }),
        ),
        SidebarXItem(
          icon: Icons.settings,
          label: 'Settings',
          onTap: (() {
            context.push('/settings');
          }),
        ),
        SidebarXItem(
          icon: Icons.logout_sharp,
          label: 'Sign out',
          onTap: (() {
            RootPage.logged = false;
            //DashboardPage.logOut = true;
            //TODO Find out how to make the context pop() not go()
            context.go('/');
          }),
        ),
      ],
      theme: const SidebarXTheme(
        itemTextPadding: const EdgeInsets.all(10.0),
        itemMargin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedTextStyle: TextStyle(color: Colors.white),
        selectedItemTextPadding: EdgeInsets.only(left: 5),
      ),
      extendedTheme: const SidebarXTheme(
        width: 175,
        textStyle: TextStyle(color: Colors.white),
      ),
      showToggleButton: false,
    );
  }
}
