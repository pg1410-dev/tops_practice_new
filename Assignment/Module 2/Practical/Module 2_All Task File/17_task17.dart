// Task 17:
// Create a class called Book with properties like title, author, and publication year. Add
// methods to display the book’s details and a method to check if it’s over 10 years old.


  void main() {
    Book book = Book("1984", "George Orwell", 1949);
    book.displayDetails();
    print("Is the book over 10 years old? ${book.isOverTenYearsOld()}");
  }


class Book {
  String title;
  String author;
  int year;

  Book(this.title, this.author, this.year);



  void displayDetails() {
    print('Title: $title');
    print('Author: $author');
    print('Publication Year: $year');
  }

  bool isOverTenYearsOld() {
    int currentYear = DateTime.now().year;
    return (currentYear - year) > 10;
  }
}