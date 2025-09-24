// Task 18:
// Define a BankAccount class with properties like account number, account holder, and
// balance. Add methods to deposit, withdraw, and check the balance. Ensure the withdraw
// method doesn’t allow overdrafts.


void main() {
  BankAccount account = BankAccount("123456789", "John Doe", 1000.0);

  account.deposit(500.0);
  account.withdraw(200.0);
  print("Current Balance: ${account.checkBalance()}");
  account.withdraw(1500.0); // Attempting to withdraw more than the balance
}

class BankAccount {
  String accountNumber;
  String accountHolder;
  double balance;

  BankAccount(this.accountNumber, this.accountHolder, this.balance);

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("Deposited: $amount");
    } else {
      print("Invalid deposit amount");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print("Withdrew: $amount");
    } else {
      print("Invalid withdraw amount or insufficient funds");
    }
  }

  double checkBalance() {
    return balance;
  }
}
