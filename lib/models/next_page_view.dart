import 'package:mohar_app/Pages/google_signin.dart';
import 'package:mohar_app/Pages/signup_page.dart';

enum SignupType { google, normal }

class NextPageViewModel {
  SignupType signupType;
  GogArguments? gogArguments;
  SignupArguments? signupArguments;

  NextPageViewModel({
    required this.signupType,
    this.gogArguments,
    this.signupArguments,
  });
}
