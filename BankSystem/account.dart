import 'user.dart';
import 'dart:io';

class Account {
  String accountNumber;
  double _balance;
  String password;
  User owner;

  Account({
    required this.accountNumber,
    required double balance,
    required this.password,
    required this.owner,
  }) : _balance = balance;

  get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: $amount | New Balance: $_balance");
    } else {
      print("Invalid deposit amount.");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrawn: $amount | Remaining Balance: $_balance");
    } else {
      print("Invalid or insufficient funds.");
    }
  }

  void changePassword(String newPassword) {
    String NationalId = stdin.readLineSync()!;
    ;
    if (NationalId != owner.nationalId) {
      print("National ID does not match.");
    } else {
      password = newPassword;
      print("Password changed successfully.");
    }
  }

  void displayAccountDetails() {
    print("Account Number: $accountNumber");
    print("Balance: $_balance");
    print("User Info:");
    owner.displayUserInfo();
  }
}
