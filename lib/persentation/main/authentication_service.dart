import 'package:netify/app/app_prefs.dart';
import 'package:netify/app/di.dart';
import 'package:rxdart/rxdart.dart';

class AuthenticationService {
  // BehaviorSubject that contains the auth token
  final _isUserSignedIn = BehaviorSubject<bool>.seeded(false);
  final AppPreferences _appPreferences = instance<AppPreferences>();

  AuthenticationService();
//  AuthenticationService._(this._appPreferences);
//   static final AuthenticationService _instance =
//       AuthenticationService._(instance<AppPreferences>());
//   factory AuthenticationService() => _instance;
  // Stream getter
  Stream<bool> get isUserSignedIn => _isUserSignedIn.stream;
  // Current value getter
  bool get token => _isUserSignedIn.value;
  //Future<bool> signInUser(String userName, String Password) async {
  Future<bool> signInUser(String token) async {
    //In Future if required we might have to implement the sign in logic here.
    // Store the token in SharedPreferences
    await _appPreferences.setJwtToken(token);

    _isUserSignedIn.add(true);

    return true;
  }

  Future<void> signOutUser() async {
    // Clear the token from SharedPreferences
    await _appPreferences.removeJwtToken();

    // Update the _tokenSubject
    _isUserSignedIn.add(false);
  }

  // Future<void> loadToken() async {
  // //   // Load the token from SharedPreferences
  // //   String? loadedToken = prefs.getString('jwt_token');

  // //   // Update the _tokenSubject
  // //   _tokenSubject.add(loadedToken);
  //  }

  // Don't forget to close the BehaviorSubject when the AuthenticationService is disposed
  void dispose() {
    _isUserSignedIn.close();
  }
}
