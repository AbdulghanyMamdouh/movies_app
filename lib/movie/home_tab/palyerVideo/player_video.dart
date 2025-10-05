// import 'package:flutter/material.dart';
// import 'package:movies_app/model/NewReleases.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// // import 'package:movies_app/model/Movie.dart'; // Make sure to import the Movie class

// class PlayerVideo extends StatefulWidget {
//   static const String routeName = 'player_video';

//   @override
//   State<PlayerVideo> createState() => _PlayerVideoState();
// }

// class _PlayerVideoState extends State<PlayerVideo> {
//   late YoutubePlayer youtubePlayer;
//   late YoutubePlayerController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = YoutubePlayerController(
//       initialVideoId: 'nPt8bK2gbaU',
//       flags: YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//         enableCaption: false,
//       ),
//     );
//     youtubePlayer = YoutubePlayer(
//       controller: controller,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('{movie.title}'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             width: 499,
//             height: 500,
//             child: Stack(
//               children: [
//                 YoutubePlayer(
//                   controller: controller,
//                 ),
//               ],
//             ),
//           ),
//           _buildText('jj'),
//           FloatingActionButton(
//             onPressed: () {},
//             child: Icon(Icons.play_arrow_rounded),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildText(String string,
//       {double fontSize = 17,
//       FontWeight weight = FontWeight.normal,
//       Color color = Colors.black}) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       alignment: Alignment.center,
//       child: Text(
//         string,
//         style: TextStyle(
//           fontSize: fontSize,
//           fontWeight: weight,
//           color: color,
//         ),
//       ),
//     );
//   }
// }
