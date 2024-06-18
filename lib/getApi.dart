// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// impgit ort 'package:flutter/material.dart';
//
// class GetApiWithListview extends StatefulWidget {
//   const GetApiWithListview({super.key});
//
//   @override
//   State<GetApiWithListview> createState() => _GetApiWithListviewState();
// }
//
// class _GetApiWithListviewState extends State<GetApiWithListview> {
//   List<dynamic> jsonList = [];
//   final CarouselController _carouselController = CarouselController();  // Carousel controller
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   void getData() async {
//     try {
//       var response = await Dio().get('https://fakestoreapi.com/products');
//       if (response.statusCode == 200) {
//         setState(() {
//           jsonList = response.data as List<dynamic>;
//         });
//       } else {
//         print(response.statusCode);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         title: const Text('Shopping',style: TextStyle(fontWeight: FontWeight.w600),),
//       ),
//       body:Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             SizedBox(height: 10,),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 50,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: Colors.grey,
//                   borderRadius: BorderRadius.circular(50)
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(Icons.search),
//                       Text('Search any product or url'),
//                       Icon(Icons.camera_alt)
//                     ],
//                   ),
//                 ),
//
//               ),
//             ),
//             //SizedBox(height: 20,),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("We thik you will love these",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
//                   IconButton(
//                     icon: Icon(Icons.arrow_forward_ios_rounded),
//                     onPressed: (){
//                       _carouselController.nextPage(); // Move to the next page
//                     },
//
//                   )
//                 ],
//               ),
//             ),
//
//
//
//             Expanded(
//               child: CarouselSlider.builder(
//                 itemCount: jsonList.length,
//                 itemBuilder: (BuildContext context, int index, int realIndex) {
//                   var item = jsonList[index];
//                   return Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: SizedBox(
//                       height: 300, // Set the height of the card
//                       width: 300, // Set the width of the card
//                       child: IntrinsicHeight(
//                         child: Card(
//                           color: Colors.grey,
//                           clipBehavior: Clip.hardEdge,
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Expanded(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                  Padding(
//                                    padding: const EdgeInsets.only(left: 0.0),
//                                    child: Container(
//                                      height: 40,
//                                      width: 40,
//                                      decoration: BoxDecoration(
//                                        color: Colors.pink,
//                                        shape: BoxShape.circle
//                                      ),
//                                      child: IconButton(
//                                        color: Colors.white,
//                                        icon: Icon(Icons.heart_broken_rounded),
//                                        onPressed: (){},
//                                      ),
//                                    ),
//                                  ),
//                                   Center(
//                                     child: Image.network(
//                                       item['image'],
//                                       width: 100,
//                                       height: 100,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   SizedBox(height: 20,),
//                                   Center(
//                                     child: Text(
//                                       item['title'],
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.normal, fontSize: 15),
//                                     ),
//                                   ),
//                                   SizedBox(height: 20,),
//                                   Row(
//                                     children: [
//                                       Icon(Icons.star,color: Colors.yellow,),
//                                       Text(
//                                         '${item['rating']['rate']}',
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 15,
//                                             color: Colors.black),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 15,),
//                                    Row(
//                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                      children: [
//                                        Container(
//                                          height:50,
//                                          width: 70,
//                                          decoration: BoxDecoration(
//                                            color: Colors.white,
//                                            borderRadius: BorderRadius.circular(10)
//                                          ),
//                                          child: Padding(
//                                            padding: const EdgeInsets.all(8.0),
//                                            child: Text(
//                                               '₹${item['price']}',
//                                               style: const TextStyle(
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 20,
//                                                   color: Colors.green),
//                                             ),
//                                          ),
//                                        ),
//                                         SizedBox(width: 50,),
//                                        TextButton.icon(
//                                          onPressed: () {
//                                            // Your onPressed function here
//                                          },
//                                          icon: Icon(Icons.shopping_cart), // The prefix icon
//                                          label: Text('Add to cart'), // The text label
//                                          style: TextButton.styleFrom(
//                                            backgroundColor: Colors.brown, // Background color
//                                            foregroundColor: Colors.white, // Text and icon color
//                                            minimumSize: Size(100, 50), // Minimum size of the button
//                                          ),
//                                        )
//
//
//                                      ],
//                                    ),
//                                         ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 options: CarouselOptions(
//                   height: 400,
//                   autoPlay: false,
//                   enlargeCenterPage: true,
//                   aspectRatio: 16 / 9,
//                   viewportFraction: 0.8,
//                 ),
//                 carouselController: _carouselController,
//               ),
//             )
//
//           ],
//         ),
//       )
//
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';

class GetApiWithListview extends StatefulWidget {
  const GetApiWithListview({super.key});

  @override
  State<GetApiWithListview> createState() => _GetApiWithListviewState();
}

class _GetApiWithListviewState extends State<GetApiWithListview> {
  List<dynamic> jsonList = [];
  final CarouselController _carouselController = CarouselController();  // Carousel controller

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio().get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data as List<dynamic>;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Cart'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.search),
                      Text('Search any product or url'),
                      Icon(Icons.camera_alt)
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("We think you'll love these", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () {
                      _carouselController.nextPage(); // Move to the next page
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: CarouselSlider.builder(
                itemCount: jsonList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  var item = jsonList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 300, // Set the height of the card
                      width: 300, // Set the width of the card
                      child: IntrinsicHeight(
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        shape: BoxShape.circle
                                    ),
                                    child: IconButton(
                                      color: Colors.white,
                                      icon: Icon(Icons.favorite_border),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Image.network(
                                    item['image'],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    item['title'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal, fontSize: 15),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text(
                                      '${item['rating']['rate']}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Colors.white,
                                        ),

                                        height:50,
                                        width: 70,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '₹-${item['price']}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                                color: Colors.green),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {
                                        // Your onPressed function here
                                      },
                                      icon: Icon(Icons.shopping_cart), // The prefix icon
                                      label: Text('add to card'), // The text label
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.brown, // Background color
                                        foregroundColor: Colors.white, // Text and icon color
                                        minimumSize: Size(100, 50), // Minimum size of the button
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 400,
                  autoPlay: false, // Disable auto play
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                ),
                carouselController: _carouselController, // Attach the controller here
              ),
            )
          ],
        ),
      ),
    );
  }
}
