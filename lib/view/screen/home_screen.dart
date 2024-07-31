// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:practice_api_r/models/product_model.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   Future<ProductModel> apiService() async {
//     try {
//       var response = await http.get(Uri.parse(
//           "https://cit-ecommerce-codecanyon.bandhantrade.com/api/app/v1/products"));
//       var data = jsonDecode(response.body.toString());
//       if (response.statusCode == 200) {
//         return ProductModel.fromJson(data);
//       } else {
//         return ProductModel.fromJson(data);
//       }
//     } catch (e) {
//       print('Error fetching products: $e');
//       throw e;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Practice Api'),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           child: FutureBuilder<ProductModel>(
//               future: apiService(),
//               builder: (context, AsyncSnapshot<ProductModel> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                       child:
//                           CircularProgressIndicator()); // Show loading indicator
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }
//                 return GridView.builder(
//
//                     shrinkWrap: true,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         mainAxisSpacing: 5,
//                         crossAxisSpacing: 5,
//                         childAspectRatio: 0.6,
//                         crossAxisCount: 2),
//                     itemCount: snapshot.data!.products!.length,
//                     itemBuilder: (context, index) {
//                       var imageUrl = snapshot.data!.products![index].image;
//                       return Container(
//                         color: Colors.red,
//                         child: Column(
//                           children: [
//                            Container(
//                              color: Colors.yellow,
//                              decoration: BoxDecoration(
//                                color: Colors.yellow,
//                                image: DecorationImage(
//                                    image:
//                                    NetworkImage(imageUrl!))
//                              ),
//                            ),
//                             Text(snapshot.data!.products![index].brand.toString()),
//                             Text(snapshot.data!.products![index].rating.toString()),
//                             Text(snapshot.data!.products![index].regPrice.toString()),
//
//                           ],
//                         ),
//                       );
//                     });
//               }),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:practice_api_r/controller/api%20call/product_api.dart';
import 'package:practice_api_r/models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  myProducts() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Api'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<ProductModel>(
              future: ProductService.apiService(),
              builder: (context, AsyncSnapshot<ProductModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Prevent scroll conflict
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                  ),
                  itemCount: snapshot.data!.products!.length,
                  itemBuilder: (context, index) {
                    var imageUrl = snapshot.data!.products![index].image;

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            "https://cit-ecommerce-codecanyon.bandhantrade.com/${snapshot.data?.products?[index].image}",
                            height: 230,

                            fit: BoxFit.fitHeight,
                          ),
                          SizedBox(
                            height: 80,
                            width: 300,
                            child: Card(
                              elevation: 8,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!.products![index].nameEn
                                        .toString(),
                                    style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,

                                  ),
                                  Text(
                                    snapshot.data!.products![index].rating
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    snapshot.data!.products![index].regPrice
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
