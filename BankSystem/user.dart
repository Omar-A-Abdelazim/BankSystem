class User {
  String name;
  String nationalId;
  String email;
  String phone;

  User({
    required this.name,
    required this.nationalId,
    required this.email,
    required this.phone,
  });

  void displayUserInfo() {
    print("Name: $name");
    print("National ID: $nationalId");
    print("Email: $email");
    print("Phone: $phone");
  }
}
