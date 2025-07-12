import 'dart:io';
import 'account.dart';
import 'BonusAccount.dart';
import 'user.dart';
import 'account_manager.dart';
import 'support.dart';

void main() {
  final manager = AccountManager();
  Account? currentAccount;

  for (int i = 0; i < 3; i++) {
    print("Are you a new user? (y/n)");
    String? answer = stdin.readLineSync();

    if (answer?.toLowerCase() == 'y') {
      print("Enter your name:");
      String name = stdin.readLineSync()!;

      print("Enter your email:");
      String email = stdin.readLineSync()!;

      print("Enter your phone number:");
      String phone = stdin.readLineSync()!;

      print("Enter your national ID:");
      String nationalId = stdin.readLineSync()!;

      print("Choose a 4-digit password:");
      String password = stdin.readLineSync()!;

      String accountNumber = DateTime.now().millisecondsSinceEpoch.toString();
      print("Your account number is: $accountNumber");

      User newUser = User(
        name: name,
        email: email,
        phone: phone,
        nationalId: nationalId,
      );

      print("Choose account type: 1. Normal  2. Bonus");
      String? type = stdin.readLineSync();

      if (type == '2') {
        currentAccount = BonusAccount(
          accountNumber: accountNumber,
          balance: 0.0,
          password: password,
          owner: newUser,
        );
      } else {
        currentAccount = Account(
          accountNumber: accountNumber,
          balance: 0.0,
          password: password,
          owner: newUser,
        );
      }

      manager.addAccount(currentAccount);
      print("Account created successfully!\n");
    } else {
      // تسجيل الدخول
      print("Enter your account number:");
      String accountNumber = stdin.readLineSync()!;

      print("Enter your password:");
      String password = stdin.readLineSync()!;

      currentAccount = manager.login(accountNumber, password);

      if (currentAccount == null) {
        print("Login failed. Try again.");
        continue;
      }
    }

    // بعد ما سجل الدخول أو عمل حساب
    bool sessionActive = true;
    while (sessionActive) {
      print("\nWhat would you like to do?");
      print("1. Deposit");
      print("2. Withdraw");
      print("3. Display Account Info");
      print("4. Apply Interest (Bonus only)");
      print("5. Delete Account");
      print("6. Bank Support");
      print("7. Reset Password");
      print("8. Exit");

      String? option = stdin.readLineSync();

      if (option == '1') {
        print("Enter amount to deposit:");
        double amount = double.parse(stdin.readLineSync()!);
        currentAccount?.deposit(amount);
      } else if (option == '2') {
        print("Enter amount to withdraw:");
        double amount = double.parse(stdin.readLineSync()!);
        currentAccount?.withdraw(amount);
      } else if (option == '3') {
        currentAccount?.displayAccountDetails();
      } else if (option == '4') {
        if (currentAccount is BonusAccount) {
          currentAccount.BankInterest();
        } else {
          print("Interest not available for this account.");
        }
      } else if (option == '5') {
        manager.removeAccount(currentAccount!.accountNumber);
        currentAccount = null;
        print("Account deleted.");
        sessionActive = false;
      } else if (option == '6') {
        Support().startSupport();
      } else if (option == '7') {
        print("Enter new password:");
        currentAccount?.changePassword();
      } else if (option == '8') {
        print("Session ended.");
        sessionActive = false;
      } else {
        print("Invalid option.");
      }
    }
  }

  print("\n Program Ended. Thanks for using our Bank System!");
}
