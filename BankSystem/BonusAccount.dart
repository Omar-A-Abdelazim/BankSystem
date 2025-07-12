import 'account.dart';
import 'user.dart';

class BonusAccount extends Account {
  BonusAccount({
    required String accountNumber,
    required double balance,
    required String password,
    required User owner,
  }) : super(
         accountNumber: accountNumber,
         balance: balance,
         password: password,
         owner: owner,
       );

  @override
  void withdraw(double amount) {
    if (amount <= balance!) {
      deposit(-amount);
    } else {
      print("Your balance is not enough");
    }
  }

  void BankInterest() {
    double InterestRate = 0;
    print(
      "If balance < 1000 → bonus is 5%, from 1000 to 10000 → 10%, above 10000 → 20%",
    );
    if (balance <= 1000) {
      InterestRate = 0.05;
    } else if (balance <= 10000) {
      InterestRate = 0.1;
    } else if (balance > 10000) {
      InterestRate = 0.2;
    } else {
      print("A problem has occurred, please re -enter the number");
    }

    int interest = (balance! * InterestRate).toInt();
    print(
      "Your bonus will be $interest after one month. You can claim it then.",
    );
  }
}
