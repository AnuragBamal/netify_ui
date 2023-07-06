import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/persentation/main/billing/billing.dart';
import 'package:netify/persentation/main/home/home_page.dart';
import 'package:netify/persentation/main/plans/plans.dart';
import 'package:netify/persentation/main/reports/reports.dart';
import 'package:netify/persentation/main/settings/settings.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/styles_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';
import 'package:netify/services/authentication_service.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final AuthenticationService _authenticationService =
      instance<AuthenticationService>();
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    PlansView(),
    Billing(),
    Reports(),
    Settings(),
  ];
  static const List<String> _titleOptions = <String>[
    "Home",
    "Plans",
    "Billing",
    "Reports",
    "Settings",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text(_titleOptions.elementAt(_selectedIndex)),
          actions: [
            IconButton(
                onPressed: () {
                  _authenticationService.signOutUser();
                },
                icon: const Icon(Icons.logout))
          ]),
      body: Container(
          color: ColorManager.surfaceColor,
          child: Center(child: _widgetOptions.elementAt(_selectedIndex))),
      bottomNavigationBar: BottomAppBar(
        //color: ColorManager.primaryColor,
        //shape: const CircularNotchedRectangle(),
        notchMargin: 12.0,
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: IconButton(
                      icon: const Icon(Icons.wifi, color: Colors.white),
                      onPressed: () => _onItemTapped(1),
                      tooltip: "Plans",
                    ),
                  ),
                  Text(
                    "Plans",
                    style: getBoldStyle(
                        color: ColorManager.surfaceColor,
                        fontSize: AppSize.s12),
                  )
                ],
              ),
            ),
            FittedBox(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.receipt,
                        color: Colors.white,
                      ),
                      onPressed: () => _onItemTapped(2),
                      tooltip: "Billing",
                    ),
                  ),
                  Text(
                    "Billing",
                    style: getBoldStyle(
                        color: ColorManager.surfaceColor,
                        fontSize: AppSize.s12),
                  )
                ],
              ),
            ),
            IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () => _onItemTapped(0)),
            FittedBox(
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.bar_chart, color: Colors.white),
                    onPressed: () => _onItemTapped(3),
                    tooltip: "Reports",
                  ),
                  Text(
                    "Reports",
                    style: getBoldStyle(
                        color: ColorManager.surfaceColor,
                        fontSize: AppSize.s12),
                  )
                ],
              ),
            ),
            FittedBox(
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () => _onItemTapped(4),
                    tooltip: "Settings",
                  ),
                  Text(
                    "Settings",
                    style: getBoldStyle(
                        color: ColorManager.surfaceColor,
                        fontSize: AppSize.s12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(0),
        backgroundColor: ColorManager.primaryColor,
        tooltip: 'Home',
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
