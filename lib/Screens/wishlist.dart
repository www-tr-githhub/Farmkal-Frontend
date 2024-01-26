// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class FavoritePageView extends StatelessWidget {
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title : Text("My Favorite", style: TextStyle(color: Colors.black),),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         child: Obx(() {
//           if(favoriteController.foodList.isNotEmpty){
//             return GridView.builder(
//                 itemCount: 3,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 8,
//                   childAspectRatio: 3.2/4,
//                 ),
//                 itemBuilder: (context, index) {
//                   var food = favoriteController.foodList[index];
//                   return Stack(
//                     children: [
//                       Container(
                          
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(30.0),
//                               boxShadow: [
//                                 BoxShadow(
//                                   offset: Offset(0, 3),
//                                   blurRadius: 6,
//                                   color: Colors.black.withOpacity(0.1),
//                                 )
//                               ]),
//                           child: Stack(
//                             children: [
//                               FavoriteDetail(food_image_name: food.foodImageName, food_name: food.foodName, food_category: food.foodCategory, food_price: food.foodPrice),
//                               FavoriteCartIcon(),
//                               FavoriteIcon(),
//                             ],
//                           )),
//                     ],
//                   );
//                 }
//             );
//           }
//           else{
//             return Padding(
//               padding: EdgeInsets.only(top: SizeConfig.screenHeight!/3.10),
//               child: Column(
//                 children: [
//                   Center(child: Icon(Icons.favorite, color: Colors.black12, size: SizeConfig.screenHeight!/11.39,)),
//                   SizedBox(height: SizeConfig.screenHeight!/34.15,),
//                   Center(child: Text("Your Favorite Foods", style: TextStyle(color: Colors.black12, fontSize: SizeConfig.screenHeight!/34.15),))
//                 ],
//               ),
//             );
//           }
//         }),
//       ),
//     );
//   }
// }

