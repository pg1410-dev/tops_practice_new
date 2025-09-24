import 'package:flutter/material.dart';

class AvatarBadge extends StatelessWidget {
  const AvatarBadge({
    super.key,
    required this.avatarUrl,
    this.isOnline = false,
    this.avatarSize = 50.0,
    this.badgeSize = 12.0,
    this.badgePosition = const Offset(35, 35),
  });

  final String avatarUrl;
  final bool isOnline;
  final double avatarSize;
  final double badgeSize;
  final Offset badgePosition;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: avatarSize,
      height: avatarSize,
      child: Stack(
        children: [
          CircleAvatar(
            radius: avatarSize / 2,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          Positioned(
            left: badgePosition.dx,
            top: badgePosition.dy,
            child: Container(
              width: badgeSize,
              height: badgeSize,
              decoration: BoxDecoration(
                color: isOnline ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}