import 'package:flutter/material.dart';
import 'package:ui_training/responsive.dart';

import 'model.dart';

class Component extends StatefulWidget {
  final Model model;
  const Component({required this.model, Key? key}) : super(key: key);

  @override
  State<Component> createState() => _ComponentState();
}

class _ComponentState extends State<Component> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsiveSize.getHeight(220, context),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: responsiveSize.getWidth(180, context),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          child: Image.network(
                            widget.model.image,
                            fit: BoxFit.fitHeight,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(child: Text('Loading...'));
                            },
                            errorBuilder: (context, error, stacktrace) {
                              return const Text('Some errors occurred!');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 19, top: 20),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.heart_broken,
                        size: 15,
                        color: Color.fromRGBO(
                          206,
                          106,
                          101,
                          1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.model.name,
                      style: TextStyle(
                          color: Color.fromRGBO(84, 83, 90, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'by ${widget.model.owner}',
                      style: TextStyle(color: Color.fromRGBO(170, 169, 176, 1)),
                    ),
                  ],
                ),
                FittedBox(
                  fit: BoxFit.fill,
                  child: SizedBox(
                    width: 140,
                    child: Text(
                      widget.model.description,
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(170, 169, 176, 1),
                      fontWeight: FontWeight.w400),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   RichText(text: TextSpan(
                     children: [
                       TextSpan(
                         text:
                         '\$${widget.model.price.toInt()}.',
                         style: TextStyle(
                             fontSize: 16,
                             color: Color.fromRGBO(84, 83, 90, 1),
                             fontWeight: FontWeight.bold),
                       ),
                       TextSpan(
                         text:
                         '${widget.model.price.toStringAsFixed(2).split('.').last}',
                         style: TextStyle(
                             fontSize: 10,
                             color: Color.fromRGBO(84, 83, 90, 1),
                             fontWeight: FontWeight.w600),
                       ),
                     ]
                   ),),

                    SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        primary: const Color.fromRGBO(
                          58,
                          55,
                          74,
                          1,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Buy',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
