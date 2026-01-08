// // ignore_for_file: avoid_unnecessary_containers

// import 'package:flutter/material.dart';

// void main(){
//   runApp(
//     MyApp()
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: const Color.fromARGB(221, 96, 238, 248),
//         body: SafeArea(
//           child: Column(
//             //crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox( width: double.infinity,),
//               CircleAvatar(
//                 radius: 120.0,
//                 backgroundImage: AssetImage('images/me.jpg'),
//               ),
//               Text(
//                 "Mohamad ghanem",
//                 style: TextStyle(
//                   fontFamily: 'jetBrainsMono',
//                   backgroundColor: Colors.white,
//                   color: Colors.black,
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 'Developer',
//                 style: TextStyle(
//                   fontFamily: 'jetBrainsMono',
//                   fontSize: 20.0,
//                   color: Colors.white,
//                   backgroundColor: Colors.black
//                 ),
//               ), 
//               ////////////////line divider//////////////// 
//               SizedBox(
//                 width: 200.0,
//                 height: 20.0,
//                 child: Divider(
//                   color: Colors.white,
//                 ),
//               ),
//               ////////////////CARD phone////////////////            
//               Card(
//                 color: Colors.white,
//                 margin: EdgeInsets.all(10.0),
//                 //padding: EdgeInsets.all(10.0),
//                 child: Padding(
//                   padding: EdgeInsets.all(5),
//                   child: ListTile(
//                     leading: Icon(
//                       Icons.phone,
//                       size: 30.0,
//                     ),
//                     title: Text(
//                       "+961 03 369 857",
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         fontFamily: 'jetBrainsMono',
//                       ),
//                     ),
//                     //trailing: Icon(Icons.delete),
//                   ),
//                 ),
//               ),
//               ////////////////CARD email//////////////////
//               Card(
//                 color: Colors.white,
//                 margin: EdgeInsets.all(10),
//                 //padding: EdgeInsets.all(10),
//                 child: Padding(
//                   padding: EdgeInsets.all(5),
//                   child: ListTile(
//                     leading: Icon(
//                       Icons.email,
//                       size: 30.0,
//                     ),
//                     title: Text(
//                       "ghanem@gmail.com",
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         fontFamily: 'jetBrainsMono',
//                       ),
//                     ),
//                   ),
//                 )
//               )

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

