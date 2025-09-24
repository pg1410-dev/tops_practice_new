import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int cartCount = 0;

  final List<String> products = [
    'iPhone 10',
    'Samsung Galaxy 21',
    'iPhone15 Pro Max',
    'Z Fold 6',
    'Nokia',
  ];

  void addToCart() {
    setState(() {
      cartCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart List'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 50,),
                if(cartCount > 0)
                  Positioned(
                    right: 0,
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          shape: BoxShape.circle
                      ),
                      child: Text('$cartCount',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
              ],
            ),
          ],
        ),
        body:
        ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.blueAccent,
                margin: EdgeInsets.symmetric(
                    horizontal: 15, vertical: 8),
                child: ListTile(
                  title: Text(products[index]),
                  trailing: ElevatedButton(
                    onPressed: addToCart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                    ),
                    child: Text('Add Cart',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              );
            }
        )
    );
  }
// body: Card(
//   color: Colors.black26,
//   elevation: 5,
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
//   child: Padding(padding: EdgeInsets.all(16)),
// ),

}

