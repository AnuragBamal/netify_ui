import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._privateConstructor();
  static final NavigationService _instance =
      NavigationService._privateConstructor();
  static NavigationService get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Navigating to a route
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  // Navigating back
  void goBack() {
    return navigatorKey.currentState!.pop();
  }

  // Popping until a particular route
  void popUntil(String routeName) {
    // return navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  // Navigating to a route and removing all previous routes from the stack
  Future<dynamic> navigateToAndRemoveUntil(String routeName,
      {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  // Replacing a route
  Future<dynamic> replaceRoute(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  // Popping with a result (for returning results from a route)
  void popWithResult(dynamic result) {
    navigatorKey.currentState!.pop(result);
  }

  // Pushing a named route and then removing all routes until the pushed route becomes the root of the navigation stack
  Future<dynamic> pushNamedAndRemoveUntilRoot(String routeName,
      {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }
}


// /In the case of {dynamic arguments}, it means that you can optionally pass an arguments 
// parameter to the function when you call it. dynamic is a special type in Dart that means 
// the variable can hold a value of any type.

// These arguments can be used to pass data from one route to another. For example, 
// suppose you have a detail page that needs to display data based on what the user 
// selected in a list. You could navigate to the detail page and pass the selected data through arguments.

// Here's a basic example:

// navigationService.navigateTo('DetailPage', arguments: selectedItem);

// class DetailPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Item selectedItem = ModalRoute.of(context)!.settings.arguments as Item;

//     // ...
//   }
// }