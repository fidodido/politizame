class User {
  final int id;
  final String username;
  final bool isSignIn;

  User({required this.id, required this.username, required this.isSignIn}) {
    if (username == 'caca') {
      throw "The username can't be caca.";
    }
  }
}
