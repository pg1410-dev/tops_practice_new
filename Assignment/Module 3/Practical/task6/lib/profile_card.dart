import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  final imageUrl =
      'https://stat4.bollywoodhungama.in/wp-content/uploads/2024/01/First-look-of-Shree-Ram-Jai-Hanuman-gets-620.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile Card With CircleAvtar Widget')),
      ),
      backgroundColor: Colors.blueAccent,
      body: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shree Ram',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Lord Vishnu Avtar',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.deepOrangeAccent.shade100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Shree Ram is a central deity in Hinduism and a hero of the Ramayana, an ancient epic that portrays him as an ideal man and the seventh avatar of Lord Vishnu.',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: Colors.grey[800],
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Ayodhya',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(onPressed: () {},
                      child: Text('More Details'),
                  ),
                ],
              ),
            ],
          ),
        ),

        // child:
        // Row(
        //   children: [
        //     CircleAvatar(
        //       backgroundImage: NetworkImage(imageUrl),
        //       foregroundColor: Colors.deepOrange,
        //     ),
        //     Column(
        //       children: [
        //         Text('Jay Shree Ram'),
        //         Text(
        //           'Shree Ram is a Lord Vishnu Avtar. Shree Ram Known as a Maryada Purushotom',
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
