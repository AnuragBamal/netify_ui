import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/persentation/main/billing/billing.dart';
import 'package:netify/persentation/main/home/home_page.dart';
import 'package:netify/persentation/main/payments/payments.dart';
import 'package:netify/persentation/main/plans/plans.dart';
import 'package:netify/persentation/main/reports/reports.dart';
import 'package:netify/persentation/main/settings/settings.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/styles_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';
import 'package:netify/services/authentication_service.dart';

class Main extends StatefulWidget {
  final LoginUserInfoArgument argument;
  const Main({
    super.key,
    required this.argument,
  });

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final AuthenticationService _authenticationService =
      instance<AuthenticationService>();
  int _selectedIndex = 0;
  // bool _isSettingsPressed = false;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    PlansView(),
    Billing(),
    Reports(),
    Payments(),
    Settings(),
  ];
  static const List<String> _titleOptions = <String>[
    "Home",
    "Plans",
    "Billing",
    "Reports",
    "Payments",
    "Settings",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // _isSettingsPressed = false;
    });
  }

  void _onSettingsPressed() {
    setState(() {
      // _isSettingsPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text(_titleOptions.elementAt(_selectedIndex)),
          actions: [
            if (widget.argument.roleId == 0)
              IconButton(
                  onPressed: () {
                    _onItemTapped(5);
                  },
                  icon: const Icon(Icons.settings_outlined)),
            IconButton(
                onPressed: () {
                  _authenticationService.signOutUser();
                },
                icon: const Icon(Icons.logout))
          ]),
      body: Container(
          color: ColorManager.surfaceColor,
          child:
              //  _isSettingsPressed
              //     ? _widgetOptions.elementAt(5)
              //     : _widgetOptions.elementAt(_selectedIndex)),
              // if (_isSettingsPressed)
              //   return Settings()
              // else
              Center(child: _widgetOptions.elementAt(_selectedIndex))),
      bottomNavigationBar: _navigationBar(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _onItemTapped(0),
      //   backgroundColor: ColorManager.primaryColor,
      //   tooltip: 'Home',
      //   child: const Icon(Icons.home),
      // ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: ColorManager.primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wifi),
          label: 'Plans',
          backgroundColor: ColorManager.primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt),
          label: 'Billing',
          backgroundColor: ColorManager.primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Reports',
          backgroundColor: ColorManager.primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payments),
          label: 'Payments',
          backgroundColor: ColorManager.primaryColor,
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.settings),
        //   label: 'Settings',
        //   backgroundColor: ColorManager.primaryColor,
        // ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: ColorManager.shadowColor,
      onTap: _onItemTapped,
    );
  }

  Widget _navigationBar() {
    return BottomAppBar(
      //color: ColorManager.primaryColor,
      //shape: const CircularNotchedRectangle(),
      notchMargin: 12.0,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    visualDensity: const VisualDensity(vertical: -4.0),
                    padding: const EdgeInsets.all(0.0),
                    icon: const Icon(Icons.home_outlined, color: Colors.white),
                    onPressed: () => _onItemTapped(0),
                    tooltip: "Home",
                  ),
                  Text(
                    "Home",
                    style: getBoldStyle(
                        color: ColorManager.surfaceColor,
                        fontSize: AppSize.s12),
                  )
                ],
              ),
            ),
            FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    visualDensity: const VisualDensity(vertical: -4.0),
                    padding: const EdgeInsets.all(0.0),
                    icon: const Icon(Icons.wifi_outlined, color: Colors.white),
                    onPressed: () => _onItemTapped(1),
                    tooltip: "Plans",
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
                  IconButton(
                    visualDensity: const VisualDensity(vertical: -4.0),
                    padding: const EdgeInsets.all(0.0),
                    icon: const Icon(
                      Icons.receipt_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () => _onItemTapped(2),
                    tooltip: "Billing",
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
            FittedBox(
              child: Column(
                children: [
                  IconButton(
                    visualDensity: const VisualDensity(vertical: -4.0),
                    padding: const EdgeInsets.all(0.0),
                    icon: const Icon(Icons.bar_chart_outlined,
                        color: Colors.white),
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
                    visualDensity: const VisualDensity(vertical: -4.0),
                    padding: const EdgeInsets.all(0.0),
                    icon: const Icon(
                      Icons.payments_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () => _onItemTapped(4),
                    tooltip: "Payments",
                  ),
                  Text(
                    "Payments",
                    style: getBoldStyle(
                        color: ColorManager.surfaceColor,
                        fontSize: AppSize.s12),
                  )
                ],
              ),
            ),
            // FittedBox(
            //   child: Column(
            //     children: [
            //       IconButton(
            //         icon: const Icon(
            //           Icons.settings,
            //           color: Colors.white,
            //         ),
            //         onPressed: () => _onItemTapped(5),
            //         tooltip: "Settings",
            //       ),
            //       Text(
            //         "Settings",
            //         style: getBoldStyle(
            //             color: ColorManager.surfaceColor, fontSize: AppSize.s12),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
