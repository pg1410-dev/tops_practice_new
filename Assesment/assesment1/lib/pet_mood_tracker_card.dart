
// import 'package:assesment1/mood.dart';
// import 'package:flutter/material.dart';
// //import 'package:uuid/uuid.dart';
//
// class PetMoodTrackerCard extends StatefulWidget {
//   final String petName;
//
//
//   const PetMoodTrackerCard({super.key, required this.petName});
//
//   @override
//   State<PetMoodTrackerCard> createState() => _PetMoodTrackerCardState();
// }
//
// class _PetMoodTrackerCardState extends State<PetMoodTrackerCard> {
//
//
//
//   final List<Mood> _moods = [
//     Mood(name: 'Happy', emoji: '😄', color: Colors.green, date: DateTime.now()),
//     Mood(name: 'Sad', emoji: '😢', color: Colors.blue, date: DateTime.now()),
//     Mood(name: 'Energetic', emoji: '⚡', color: Colors.orange, date: DateTime.now()),
//     Mood(name: 'Sleepy', emoji: '😴', color: Colors.grey, date: DateTime.now()),
//     Mood(name: 'Jul 26, 2025', emoji: '😄', color: Colors.black38, date: DateTime.now())
//   ];
//
//
//   Mood? _selectedMood;
//   final String formattedDate = DateTime(2025).format(DateTime.now());
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//           elevation: 4.0,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12.0)),
//           margin: EdgeInsets.all(16.0),
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       widget.petName,
//                       style: TextStyle(
//                         fontSize: 24.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       formattedDate,
//                       style: TextStyle(
//                         fontSize: 14.0,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20.0),
//                 Row(
//                   children: [
//                     Text(
//                       'How is your pet feeling?',
//                       style: TextStyle(fontSize: 16.0),
//                     ),
//                     Spacer(),
//                     DropdownButton<Mood>(
//                       value: _selectedMood,
//                       hint: Text('Select Mood'),
//                       items: _moods.map((Mood mood) {
//                         return DropdownMenuItem<Mood>(
//                           value: mood,
//                           child: Row(
//                             children: [
//                               Text(mood.emoji),
//                               SizedBox(width: 8.0),
//                               Text(mood.name),
//                             ],
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (Mood? newMood) {
//                         setState(() {
//                           _selectedMood = newMood;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 24.0),
//                 _buildMoodDisplay(),
//               ],
//             ),
//           ),
//     );
//   }
//   Widget _buildMoodDisplay() {
//     if (_selectedMood == null) {
//       return Center(
//         child: Text(
//           'No mood selected for today.',
//           style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
//         ),
//       );
//     }
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
//       decoration: BoxDecoration(
//         color: _selectedMood!.color.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             _selectedMood!.emoji,
//             style: TextStyle(fontSize: 28.0),
//           ),
//           SizedBox(width: 12.0),
//           Text(
//             _selectedMood!.name,
//             style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//               color: _selectedMood!.color.withAlpha(150),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// extension on DateTime {
//   String format(DateTime dateTime) {
//     throw Exception();
//   }
// }