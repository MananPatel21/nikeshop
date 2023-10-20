import 'package:flutter/material.dart';
import '../Models/data.dart';
import '../Models/shoes.dart';
import '../Widgets/button.dart';
import '../mongodb.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int totalAmount = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalAmount();
  }

  void calculateTotalAmount() {
    totalAmount = 0;
    for (int i = 0; i < cartItems.length; i++) {
      int itemPrice = cartItems[i].colors[indexNumber[i]].price.toInt();
      int itemQuantity = int.parse(quantity[i].toString());
      totalAmount += itemPrice * itemQuantity;
    }
  }

  void updateTotalAmount() {
    calculateTotalAmount();
    setState(() {});
  }

  MongoDatabaseInit databaseInit = MongoDatabaseInit();
  void _showOrderConfirmation(BuildContext context) async {
    for (int i = 0; i < cartItems.length; i++) {
      String shoeName = cartItems[i].name;
      String color = cartItems[i].colors[indexNumber[i]].color;
      int remainingQuantity = cartItems[i].colors[indexNumber[i]].qty - quantity[i];
      await databaseInit.updateShoeQuantities(shoeName, color, remainingQuantity, indexNumber[i]);
    }

    cartItems.clear();
    indexNumber.clear();
    quantity.clear();
    updateTotalAmount();
    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your order has been placed successfully!'),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          Shoes shoe = cartItems[index];
          return ListTile(
            title: Text(shoe.name),
            subtitle: Text('Price: Rs.${int.parse(shoe.colors[indexNumber[index]].price.toString()) * quantity[index]}'),
            leading: Image.asset(
              shoe.colors[indexNumber[index]].image,
              width: 50,
              height: 50,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantity[index] > 0) {
                        quantity[index]--;
                        updateTotalAmount();
                      }
                    });
                  },
                ),
                Text(quantity[index].toString()),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity[index]++;
                      updateTotalAmount();
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      cartItems.removeAt(index);
                      indexNumber.removeAt(index);
                      quantity.removeAt(index);
                      updateTotalAmount();
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: Rs.${totalAmount.toString()}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
              CustomButton(
                onTap: () {
                  _showOrderConfirmation(context);
                },
                width: 100,
                color: Colors.green,
                child: Text('Buy', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
