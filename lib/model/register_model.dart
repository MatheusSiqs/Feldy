class RegisterData {
  String email;
  String name;
  String password;
  String confirmPassword = "";

  RegisterData(
      {required this.email, required this.name, required this.password});
}
