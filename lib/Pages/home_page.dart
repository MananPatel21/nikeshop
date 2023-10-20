import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikeshop/Pages/shoe_page.dart';
import '../Models/shoes.dart';
import '../Widgets/app_bar.dart';
import '../Widgets/bottom_bar.dart';

class HomePageShoes extends StatefulWidget {
  const HomePageShoes({super.key});

  @override
  State<HomePageShoes> createState() => _HomePageShoesState();
}

class _HomePageShoesState extends State<HomePageShoes> {

  final _pageController = PageController(viewportFraction: 0.75);
  double _currentPage = 0;
  double indexPage = 0;

  Color getColorFromString(String colorString) {
    colorString = colorString.replaceAll('#', '');
    return Color(int.parse(colorString, radix: 16) + 0xFF000000);
  }

  void _listner(){
    setState(() {
      _currentPage = _pageController.page!;
      if(_currentPage >= 0 && _currentPage < 0.7){
        indexPage = 0;
      }
      else if(_currentPage > 0.7 && _currentPage < 1.7){
        indexPage = 1;
      }
      else if(_currentPage > 1.7 && _currentPage < 2.7){
        indexPage = 2;
      }
      else if(_currentPage > 2.7 && _currentPage < 3.7){
        indexPage = 3;
      }
      else if(_currentPage > 3.7 && _currentPage < 4.7){
        indexPage = 4;
      }
      else if(_currentPage > 4.7 && _currentPage < 5.7){
        indexPage = 5;
      }
      else if(_currentPage > 5.7 && _currentPage < 6.7){
        indexPage = 6;
      }
      else if(_currentPage > 6.7 && _currentPage < 7.7){
        indexPage = 7;
      }
    });
  }

  Color getColor(){
    late final Color color;
    if(_currentPage >= 0 && _currentPage < 0.7){
      color = getColorFromString(listShoes[0].colors[0].color) == Colors.white ? Colors.black : getColorFromString(listShoes[0].colors[0].color);
    }
    else if(_currentPage > 0.7 && _currentPage < 1.7){
      color = getColorFromString(listShoes[1].colors[0].color) == Colors.white ? Colors.black : getColorFromString(listShoes[1].colors[0].color);
    }
    else if(_currentPage > 1.7 && _currentPage < 2.7){
      color = getColorFromString(listShoes[2].colors[0].color) == Colors.white ? Colors.black : getColorFromString(listShoes[2].colors[0].color);
    }
    else if(_currentPage > 2.7 && _currentPage < 3.7){
      color = getColorFromString(listShoes[3].colors[0].color) == Colors.white ? Colors.black : getColorFromString(listShoes[3].colors[0].color);
    }
    else if(_currentPage > 3.7 && _currentPage < 4.7){
      color = getColorFromString(listShoes[4].colors[0].color) == Colors.white ? Colors.black : getColorFromString(listShoes[4].colors[0].color);
    }
    else if(_currentPage > 4.7 && _currentPage < 5.7){
      color = getColorFromString(listShoes[5].colors[0].color) == Colors.white ? Colors.black : getColorFromString(listShoes[5].colors[0].color);
    }
    else if(_currentPage > 5.7 && _currentPage < 6.7){
      color = getColorFromString(listShoes[6].colors[0].color) == Colors.white ? Colors.black : getColorFromString(listShoes[6].colors[0].color);
    }
    else if(_currentPage > 6.7 && _currentPage < 7.7){
      color = getColorFromString(listShoes[7].colors[0].color) == Colors.white ? Colors.black : getColorFromString(listShoes[7].colors[0].color);
    }
    return color;
  }

  final list = ["Jordan", "Running", "LifeStyle"];

  void initState(){
    _pageController.addListener(_listner);
    super.initState();
  }

  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: List.generate(
                  list.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      list[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: index == (indexPage/3).toInt() ? getColor() : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: listShoes.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                final shoes = listShoes[index];
                final listTitle = shoes.type.split(' ');
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, _){return ShoePage(shoes: shoes);},),);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: index == indexPage ? 30 : 60),
                    child: Transform.translate(
                      offset: Offset(index == indexPage ? 0 : 20, 0),
                      child: LayoutBuilder(builder: (context, constraints) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          margin: EdgeInsets.only(top: index == indexPage ? 30 : 50, bottom: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                            color: Colors.white,
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      shoes.type,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      shoes.name,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      shoes.colors[0].price.toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        '${listTitle[0]} \n ${listTitle[1]}',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: constraints.maxHeight * 0.2,
                                left: constraints.maxWidth * 0.05,
                                right: -constraints.maxWidth * 0.16,
                                bottom: constraints.maxHeight * 0.2,
                                child: Hero(
                                  tag: shoes.name,
                                  child: Image(
                                    image: AssetImage(shoes.colors[0].image),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Material(
                                  color: getColorFromString(shoes.colors[0].color) == Colors.white ? Colors.black : getColorFromString(shoes.colors[0].color),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(36),
                                    bottomRight: Radius.circular(36),
                                  ),
                                  child: InkWell(
                                    onTap: () {

                                    },
                                    child: const SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Icon(
                                      Icons.add,
                                      size: 40,
                                    ),
                                  ),
                              ),
                                )),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 120,
            padding: const EdgeInsets.all(20),
            child: CustomBottomBar(
              color: getColor(),
            ),
          ),
        ],
      ),
    );
  }
}
