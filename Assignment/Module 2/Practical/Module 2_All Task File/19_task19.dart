// Task 19:
// Create a class hierarchy with a Vehicle superclass and Car and Bike subclasses. Implement
// methods in each subclass that print specific details, like the type of vehicle, fuel type, and
// max speed.

void main() {
  Car car = Car("Petrol", 180, 4);
  car.displayDetails();

  Bike bike = Bike("Electric", 120, true);
  bike.displayDetails();
}

class Vehicle {
  String fuelType;
  int maxSpeed;

  Vehicle(this.fuelType, this.maxSpeed);

  void displayDetails() {
    print("Fuel Type: $fuelType");
    print("Max Speed: $maxSpeed");
  }
}

class Car extends Vehicle {
  int numberOfDoors;

  Car(String fuelType, int maxSpeed, this.numberOfDoors)
      : super(fuelType, maxSpeed);

  @override
  void displayDetails() {
    print("Car Details:");
    super.displayDetails();
    print("Number of Doors: $numberOfDoors");
  }
}

class Bike extends Vehicle {
  bool hasCarrier;

  Bike(String fuelType, int maxSpeed, this.hasCarrier)
      : super(fuelType, maxSpeed);

  @override
  void displayDetails() {
    print("Bike Details:");
    super.displayDetails();
    print("Has Carrier: $hasCarrier");
  }
}
