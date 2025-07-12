import 'dart:io';

class Support {
  final Map<int, Map<String, String>> faq = {
    1: {
      "question": "How can I reset my password?",
      "answer": "Please visit the bank branch with your ID.",
    },
    2: {
      "question": "Can I open multiple accounts?",
      "answer": "Yes, but each must have a unique national ID.",
    },
    3: {
      "question": "What is the interest rate policy?",
      "answer":
          "If your balance is less than 1000, you get 5%. Between 1000 and 10000, 10%. More than 10000, 20%.",
    },
  };

  void startSupport() {
    print("📞 Welcome to Bank Support:");
    faq.forEach((key, value) {
      print("$key. ${value['question']}");
    });

    print("Enter question number:");
    var input = int.tryParse(stdin.readLineSync()!);
    if (faq.containsKey(input)) {
      print("💡 Answer: ${faq[input]!['answer']}");
    } else {
      print("❌ Invalid question number.");
    }
  }
}
