import 'package:flutter/material.dart';
import '../Models/data.dart';
import '../Models/shoes.dart';
import '../Widgets/button.dart';
import '../Widgets/transition.dart';

// class ShoePage extends StatefulWidget {
//   const ShoePage({Key? key, required this.shoes}) : super(key: key);
//   final Shoes shoes;
//   @override
//   State<ShoePage> createState() => _ShoePageState();
// }
//
// class _ShoePageState extends State<ShoePage> {
//   int valueIndexColor = 0;
//   int valueIndex = 0;
//   int valueIndexSize = 1;
//
//   Color getColorFromString(String colorString) {
//     colorString = colorString.replaceAll('#', ''); // Remove # character if present
//     return Color(int.parse(colorString, radix: 16) + 0xFF000000); // Add alpha value (opaque) to the color
//   }
//
//   double sizeShoes(int index, Size size){
//     switch (index){
//       case 0:
//         return (size.height * 0.09);
//       case 1:
//         return (size.height * 0.07);
//       case 2:
//         return (size.height * 0.05);
//       case 3:
//         return (size.height * 0.04);
//       default:
//         return (size.height * 0.05);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(color: Colors.black87),
//         child: Stack(
//           children: [
//             Positioned(
//               top: -size.height * 0.4,
//               right: -size.height * 0.18,
//               child: TweenAnimationBuilder<double>(
//                 duration: Duration(milliseconds: 250),
//                 tween: Tween(begin: 0, end: 1),
//                 builder: (context, value, _) {
//                   return AnimatedContainer(
//                     duration: const Duration(milliseconds: 400),
//                     height: value * size.height,
//                     width: value * size.width,
//                     decoration: BoxDecoration(
//                       color: getColorFromString(widget.shoes.colors[valueIndexColor].color),
//                       shape: BoxShape.circle,
//                     ),
//                   );
//                 }
//               ),
//             ),
//             Positioned(
//                 top: kToolbarHeight,
//                 left: 16,
//                 right: 16,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black54,
//                                 blurRadius: 5,
//                                 spreadRadius: 3,
//                               )
//                             ]),
//                         child: Icon(
//                           Icons.arrow_back,
//                           size: 30,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.favorite),
//                       color: Colors.white,
//                     ),
//                   ],
//                 )),
//             Positioned(
//               top: size.height * 0.2,
//               right: 0,
//               left: 0,
//               child: Padding(
//                 padding: const EdgeInsets.all(30),
//                 child: FittedBox(
//                   child: Text(
//                     widget.shoes.type,
//                     style: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ),
//             AnimatedPositioned(
//               duration: Duration(milliseconds: 250),
//                 top: size.height * 0.16,
//                 right: sizeShoes(valueIndexSize, size),
//                 left: sizeShoes(valueIndexSize, size),
//                 child: Container(
//                   width: 400,
//                   height: 400,
//                   child: Hero(
//                     tag: widget.shoes.name,
//                     child: Image(
//                       image: AssetImage(widget.shoes.colors[valueIndexColor].image),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 )),
//             Positioned(
//               top: size.height * 0.6,
//               left: 16,
//               right: 16,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ShakeTransition(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               widget.shoes.type,
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 17,
//                                   color: Colors.white),
//                             ),
//                             SizedBox(
//                               height: 8,
//                             ),
//                             Text(
//                               widget.shoes.name,
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 20),
//                             ),
//                           ],
//                         ),
//                       ),
//                       ShakeTransition(
//                         left: false,
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 27.8),
//                           child: Text(
//                             "Rs. " + widget.shoes.colors[valueIndex].price.toString(),
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   ShakeTransition(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           children: List.generate(
//                               5,
//                               (index) => Icon(
//                                     Icons.star,
//                                     color: int.parse(widget.shoes.ratings) > index
//                                         ? getColorFromString(widget.shoes.colors[valueIndexColor].color)
//                                         : Colors.white,
//                                   )),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "SIZE",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 17,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           children: List.generate(
//                             4,
//                             (index) => Padding(
//                               padding: const EdgeInsets.only(right: 16),
//                               child: CustomButton(
//                                 onTap: (){
//                                   valueIndexSize = index;
//                                   setState(() {});
//                                 },
//                                 color: index == valueIndexSize ? getColorFromString(widget.shoes.colors[valueIndexColor].color) : Colors.white,
//                                 child: Text(
//                                   '${index+7}',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 22,
//                                     color: index == valueIndexSize ? Colors.white : Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Positioned(
//                 top: size.height * 0.84,
//                 left: 16,
//                 right: 16,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ShakeTransition(
//                       child: Column(
//                         children: [
//                           Text(
//                             'COLOR',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Row(
//                             children: List.generate(
//                                 widget.shoes.colors.length,
//                                 (index) => GestureDetector(
//                                       onTap: () {
//                                         valueIndexColor = index;
//                                         setState(() {
//
//                                         });
//                                       },
//                                       child: Container(
//                                         margin: EdgeInsets.only(right: 8),
//                                         height: 30,
//                                         width: 30,
//                                         decoration: BoxDecoration(
//                                           color: getColorFromString(widget.shoes.colors[index].color),
//                                           shape: BoxShape.circle,
//                                           border: index == valueIndexColor
//                                               ? Border.all(
//                                                   color: Colors.white, width: 2)
//                                               : null,
//                                         ),
//                                       ),
//                                     )),
//                           )
//                         ],
//                       ),
//                     ),
//                     ShakeTransition(child: CustomButton(
//                       onTap: (){
//                         cartItems.add(widget.shoes);
//                         indexNumber.add(valueIndexColor);
//                         quantity.add(1);
//                       },
//                       width: 70,
//                       color: getColorFromString(widget.shoes.colors[valueIndexColor].color),
//                       child: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 35,),
//                     ))
//                   ],
//                 ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ShoePage extends StatefulWidget {
  const ShoePage({Key? key, required this.shoes}) : super(key: key);
  final Shoes shoes;

  @override
  State<ShoePage> createState() => _ShoePageState();
}

class _ShoePageState extends State<ShoePage> {
  int valueIndexColor = 0;
  int valueIndexSize = 1;
  int valueIndex = 0;

  Color getColorFromString(String colorString) {
    colorString = colorString.replaceAll('#', '');
    return Color(int.parse(colorString, radix: 16) + 0xFF000000);
  }

  double sizeShoes(int index, Size size) {
    switch (index) {
      case 0:
        return (size.height * 0.09);
      case 1:
        return (size.height * 0.07);
      case 2:
        return (size.height * 0.05);
      case 3:
        return (size.height * 0.04);
      default:
        return (size.height * 0.05);
    }
  }

  bool get isOutOfStock => widget.shoes.colors[valueIndex].qty <= 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black87),
        child: Stack(
          children: [
            Positioned(
              top: -size.height * 0.4,
              right: -size.height * 0.18,
              child: TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 250),
                  tween: Tween(begin: 0, end: 1),
                  builder: (context, value, _) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      height: value * size.height,
                      width: value * size.width,
                      decoration: BoxDecoration(
                        color: getColorFromString(widget.shoes.colors[valueIndexColor].color),
                        shape: BoxShape.circle,
                      ),
                    );
                  }
              ),
            ),
            Positioned(
              top: kToolbarHeight,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5,
                              spreadRadius: 3,
                            )
                          ]),
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.2,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: FittedBox(
                  child: Text(
                    widget.shoes.type,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 250),
              top: size.height * 0.16,
              right: sizeShoes(valueIndexSize, size),
              left: sizeShoes(valueIndexSize, size),
              child: Container(
                width: 400,
                height: 400,
                child: Hero(
                  tag: widget.shoes.name,
                  child: Image(
                    image: AssetImage(
                        widget.shoes.colors[valueIndexColor].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.6,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShakeTransition(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.shoes.type,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              widget.shoes.name,
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      ShakeTransition(
                        left: false,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 27.8),
                          child: Text(
                            "Rs. " +
                                widget.shoes
                                    .colors[valueIndex].price
                                    .toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                  ShakeTransition(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: List.generate(
                              5,
                                  (index) => Icon(
                                Icons.star,
                                color: int.parse(
                                    widget.shoes.ratings) >
                                    index
                                    ? getColorFromString(widget
                                    .shoes
                                    .colors[valueIndexColor]
                                    .color)
                                    : Colors.white,
                              )),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "SIZE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: List.generate(
                            4,
                                (index) => Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: CustomButton(
                                onTap: isOutOfStock
                                    ? null
                                    : () {
                                  valueIndexSize = index;
                                  setState(() {});
                                },
                                color: index == valueIndexSize
                                    ? getColorFromString(widget
                                    .shoes
                                    .colors[valueIndexColor]
                                    .color)
                                    : Colors.white,
                                child: Text(
                                  '${index + 7}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: index == valueIndexSize
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.84,
              left: 16,
              right: 16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShakeTransition(
                    child: Column(
                      children: [
                        Text(
                          'COLOR',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: List.generate(
                              widget.shoes.colors.length,
                                  (index) => GestureDetector(
                                onTap: isOutOfStock
                                    ? null
                                    : () {
                                  valueIndexColor = index;
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: getColorFromString(widget
                                        .shoes
                                        .colors[index]
                                        .color),
                                    shape: BoxShape.circle,
                                    border: index == valueIndexColor
                                        ? Border.all(
                                        color: Colors.white,
                                        width: 2)
                                        : null,
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  ShakeTransition(
                    child: CustomButton(
                      onTap: isOutOfStock
                          ? null
                          : () {
                        if (!isOutOfStock) {
                          cartItems.add(widget.shoes);
                          indexNumber.add(valueIndexColor);
                          quantity.add(1);
                        }
                      },
                      width: 70,
                      color: isOutOfStock
                          ? Colors.grey
                          : getColorFromString(widget
                          .shoes
                          .colors[valueIndexColor]
                          .color),
                      child: isOutOfStock
                          ? Text('Out of Stock',
                          style: TextStyle(color: Colors.white))
                          : Icon(Icons.shopping_cart_outlined,
                          color: Colors.white, size: 35),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
