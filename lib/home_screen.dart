// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/model/get_list.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   Future<Album> fetchAlbum() async {
//     final response = await http
//         .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       return Album.fromJson(jsonDecode(response.body));
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load album');
//     }
//   }

//   String? key;
//   String? mode;
//   getKey() async {
//     mode = dotenv.env['MODE'].toString();
//     key = dotenv.env['KEY'].toString();
//     setState(() {});
//   }

//   late Future<Album> futureAlbum;

//   @override
//   void initState() {
//     getKey();
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(key ?? ''),
//             Text(mode ?? ''),
//             FutureBuilder<Album>(
//               future: futureAlbum,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return Text(snapshot.data!.title);
//                 } else if (snapshot.hasError) {
//                   return Text('${snapshot.error}');
//                 }

//                 // By default, show a loading spinner.
//                 return const CircularProgressIndicator();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
