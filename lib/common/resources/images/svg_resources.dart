class SvgResources {
  static const _root = 'assets/svgs';

  final appLogo = '$_root/app_logo.svg';

  final introWelcomeText = '$_root/intro_txt.svg';
  final introSignInBtn = '$_root/intro_signin_btn.svg';
  final introSignUpBtn = '$_root/intro_signup_btn.svg';
  final introAnonymous = '$_root/intro_anonym_txt.svg';

  String get(String name) => '$_root/$name';
}
