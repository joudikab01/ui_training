import 'package:flutter/material.dart';
import 'package:ui_training/component.dart';
import 'package:ui_training/responsive.dart';

import 'model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selected = 0;
  List<Model> models = [
    Model(
        name: 'Irul Chair',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDeXK87ELHYodA2Lq7G-sP1A1BoXqMRHRfXw&usqp=CAU',
        description: 'Ergonomical for humans body curve',
        owner: 'Seto',
        price: 102.00),
    Model(
        name: 'Malik Chair',
        image:
            'https://static.dezeen.com/uploads/2022/05/ella-chair-matthew-hilton-case-furniture-design_dezeen_2364_hero-1704x959.jpg',
        description: 'Extra comfy chair with palm rest.',
        owner: 'Karjo',
        price: 221.00),
    Model(
        name: 'Irul Chair',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDeXK87ELHYodA2Lq7G-sP1A1BoXqMRHRfXw&usqp=CAU',
        description: 'Ergonomical for humans body curve',
        owner: 'Seto',
        price: 102.00),
    Model(
        name: 'Malik Chair',
        image:
            'https://static.dezeen.com/uploads/2022/05/ella-chair-matthew-hilton-case-furniture-design_dezeen_2364_hero-1704x959.jpg',
        description: 'Extra comfy chair with palm rest.',
        owner: 'Karjo',
        price: 221.00),
  ];
  List<String> categories = ['All', 'Chair', 'Table', 'Lamp', 'Floor'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          //Colors.white,
          const Color.fromRGBO(246, 246, 246, 1),
      endDrawerEnableOpenDragGesture: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: responsiveSize.getHeight(30, context),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Best Furniture',
                  style: TextStyle(
                      color: Color.fromRGBO(84, 83, 90, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                Text(
                  'Perfect Choice!',
                  style: TextStyle(
                      color: Color.fromRGBO(84, 83, 90, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 19),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: responsiveSize.getWidth(300, context),
                  height: responsiveSize.getHeight(60, context),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: const Color.fromRGBO(84, 83, 90, 1),
                      ),
                      hintText: 'Search',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          borderSide: const BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          borderSide: const BorderSide(color: Colors.white)),
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      hoverColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: responsiveSize.getWidth(60, context),
                  height: responsiveSize.getWidth(60, context),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu_open,
                      color: Color.fromRGBO(84, 83, 90, 1),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: responsiveSize.getHeight(50, context),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: responsiveSize.getWidth(80, context),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                selected = index;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: responsiveSize.getWidth(55, context),
                             height: responsiveSize.getHeight(50, context),
                              decoration: BoxDecoration(
                                color: selected == index
                                    ? Color.fromRGBO(
                                  58,
                                  55,
                                  74,
                                  1,
                                )
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(18)
                              ),
                              
                              child: Text(
                                categories[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: selected == index
                                        ? Colors.white
                                        : Color.fromRGBO(170, 169, 176, 1)),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: responsiveSize.getHeight(550, context),
                  child: ListView.builder(
                      itemCount: models.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Component(
                            model: models[index],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
