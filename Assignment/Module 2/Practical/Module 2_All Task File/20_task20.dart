// Task 20:
// Write a program that simulates a shopping cart. Define classes for Product, Cart, and Order.
// Allow users to add products to the cart and calculate the total price of the items.

void main() {
  Product product1 = Product("Laptop", 999.99);
  Product product2 = Product("Smartphone", 499.99);

  Cart cart = Cart();
  cart.addProduct(product1);
  cart.addProduct(product2);

  Order order = Order(cart);
  print("Total Order Price: \$${order.calculateTotal()}");
}

class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class Cart {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
  }

  double getTotalPrice() {
    double total = 0;
    for (var product in products) {
      total += product.price;
    }
    return total;
  }
}

class Order {
  Cart cart;

  Order(this.cart);

  double calculateTotal() {
    return cart.getTotalPrice();
  }
}
