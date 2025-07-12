import 'account.dart';

class AccountManager {
  final List<Account> _accounts = [];

  void addAccount(Account account) {
    _accounts.add(account);
    print("Account added: ${account.accountNumber}");
  }

  void removeAccount(String accountNumber) {
    _accounts.removeWhere((acc) => acc.accountNumber == accountNumber);
    print("Account removed: $accountNumber");
  }

  Account? login(String accountNumber, String password) {
    for (var acc in _accounts) {
      if (acc.accountNumber == accountNumber && acc.password == password) {
        print("🔐 Login successful.");
        return acc;
      }
    }
    return null;
  }
}
