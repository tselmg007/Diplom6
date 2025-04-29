// import 'package:flutter/material.dart';
// import 'package:traffic/Pages/UserExercise.dart';
// import 'package:traffic/Pages/number10.dart';
// import 'package:traffic/Pages/number11.dart';
// import 'package:traffic/Pages/number12.dart';
// import 'package:traffic/Pages/number13.dart';
// import 'package:traffic/Pages/number14.dart';
// import 'package:traffic/Pages/number15.dart';
// import 'package:traffic/Pages/number16.dart';
// import 'package:traffic/Pages/number17.dart';
// import 'package:traffic/Pages/number18.dart';
// import 'package:traffic/Pages/number19.dart';
// import 'package:traffic/Pages/number2.dart';
// // import 'package:traffic/answers/number20%20copy%202.dart';
// import 'package:traffic/Pages/number21%20copy%203.dart';
// import 'package:traffic/Pages/number22%20copy.dart';
// import 'package:traffic/Pages/number23%20copy.dart';
// import 'package:traffic/Pages/number24.dart';
// import 'package:traffic/Pages/number3.dart';
// import 'package:traffic/Pages/number4.dart';
// import 'package:traffic/Pages/number5.dart';
// import 'package:traffic/Pages/number6.dart';
// import 'package:traffic/Pages/number7.dart';
// import 'package:traffic/Pages/number8.dart';
// import 'package:traffic/Pages/number9.dart';
// import 'package:traffic/sizeeffect.dart';

// class AnswerPage extends StatefulWidget {
//   const AnswerPage({Key? key}) : super(key: key);

//   @override
//   State<AnswerPage> createState() => _AnswerPageState();
// }

// class _AnswerPageState extends State<AnswerPage> {
//   final List<Widget> index = [];

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Жолооны тест 800 асуулт",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         // centerTitle: true,
//         // leading: MenuWidget(),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               "Асуултууд",
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => UserExercise(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Нэр томьёоны тодорхойлолт-20",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(),
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => two(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       ""
//                       "Механикжсан тээврийн хэрэгслийн-20"
//                       "\nангилал",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => three(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Жолоочийн үүрэг-30",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => four(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       """Тусгай дуут болон гэрлэн дохио
//  ажилуулсан тээврийн хэрэгслийн
// хөдөлгөөн-10""",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => five(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Замын тэмдэг-120",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => six(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Замын тэмдэглэл-40",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => seven(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Замын хөдөлгөөн зохицуулах дохио-40",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => eight(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Анхааруулах дохио ба таних дохио-40",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => nine(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Хөдөлгөөн эхлэх болон чиг өөрчлөх-80",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ten(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Тээврийн хэрэгсэл байрлан явах-80",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         eleven(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Тээврийн хэрэгслийн хурд-20",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         twelve(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Гүйцэж түрүүлэх ба гүйцэх-20",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         thirteen(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Түр ба удаан зогсох-80",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         fourteen(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Уулзвар нэвтрэх-70",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         fifteen(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Явган хүний гарц нэвтрэх-10",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         sixteen(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Төмөр замын гарам нэвтрэх-20",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         seventeen(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Гадна талын гэрэлтүүлэх хэрэглийг\nхэрэглэх-10",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         eighteen(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Хорооллын дотор хөдөлгөөн-10",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         nineteen(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Механикжсан тээврийн хэрэгслийг\nчирэх-10",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         twentyone(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Хүн ба ачаа тээвэрлэх-20",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         twentytwo(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Тээврийн хэрэгслийн эвдрэл,\nгэмтэл, техникийн зөрчил-20",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         twentythree(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Тээврийн хэрэгслийг аюулгүй\nхолоодох онол-10",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         twentyfour(), // Use the correct class name
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/police.png', width: 36, height: 36),
//                     SizedBox(width: 10),
//                     Text(
//                       "Эмнэлгийн анхны тусламж-10",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(), // Add Spacer to push elements to the left
//                     Image.asset('assets/next.png', width: 24, height: 24),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
