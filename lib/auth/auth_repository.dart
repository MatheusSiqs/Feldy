class AuthRepository{
  Future<void> login() async{
    print('Attemptin login');
    await Future.delayed(const Duration(seconds: 3));
    print('Logged in');
  }
}