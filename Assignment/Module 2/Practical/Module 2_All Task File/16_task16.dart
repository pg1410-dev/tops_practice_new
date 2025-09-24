// Task 16:
// Create a simple address book using a map, where the keys are names and the values are
// phone numbers. Add, update, and remove entries based on user input.

import 'dart:io';

void main() {
  Map<String, String> addressBook = {};
  while (true) {
    stdout.write("Enter a command (add, update, remove, display, exit): ");
    String? command = stdin.readLineSync();

    if (command == null || command.isEmpty) {
      print("Invalid input");
      continue;
    }

    switch (command) {
      case "add":
        addEntry(addressBook);
        break;
      case "update":
        updateEntry(addressBook);
        break;
      case "remove":
        removeEntry(addressBook);
        break;
      case "display":
        displayEntries(addressBook);
        break;
      case "exit":
        print("Exiting...");
        return;
      default:
        print("Unknown command");
    }
  }
}

void addEntry(Map<String, String> addressBook) {
  stdout.write("Enter name: ");
  String? name = stdin.readLineSync();
  stdout.write("Enter phone number: ");
  String? phone = stdin.readLineSync();

  if (name != null && phone != null) {
    addressBook[name] = phone;
    print("Entry added");
  }
}

void updateEntry(Map<String, String> addressBook) {
  stdout.write("Enter name of the entry to update: ");
  String? name = stdin.readLineSync();

  if (name != null && addressBook.containsKey(name)) {
    stdout.write("Enter new phone number: ");
    String? newPhone = stdin.readLineSync();
    if (newPhone != null) {
      addressBook[name] = newPhone;
      print("Entry updated");
    }
  } else {
    print("Entry not found");
  }
}

void removeEntry(Map<String, String> addressBook) {
  stdout.write("Enter name of the entry to remove: ");
  String? name = stdin.readLineSync();

  if (name != null && addressBook.containsKey(name)) {
    addressBook.remove(name);
    print("Entry removed");
  } else {
    print("Entry not found");
  }
}

void displayEntries(Map<String, String> addressBook) {
  if (addressBook.isEmpty) {
    print("Address book is empty");
  } else {
    print("Address Book:");
    addressBook.forEach((name, phone) {
      print("Name: $name, Phone: $phone");
    });
  }
}
