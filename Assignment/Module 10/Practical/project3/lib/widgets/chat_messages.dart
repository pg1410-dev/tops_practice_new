import 'package:project3/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({super.key});

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  @override
  Widget build(BuildContext context) {
    final authenticatedUserId = FirebaseAuth.instance.currentUser!.uid;

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chat")
            .orderBy("createdAt", descending: true)
            .snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No Data..."));
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wront..."));
          }
          final loadedMessages = snapshot.data!.docs;
          return ListView.builder(
              padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
              itemCount: loadedMessages.length,
              reverse: true,
              itemBuilder: (ctx, index) {
                final chatMessage = loadedMessages[index].data();
                final nextMessage = index + 1 < loadedMessages.length
                    ? loadedMessages[index + 1].data()
                    : null;
                final currentMessageUserId = chatMessage["userId"];
                final nextMessageUserId =
                    nextMessage != null ? nextMessage["userId"] : null;
                final nextUserIsSame =
                    currentMessageUserId == nextMessageUserId;
                if (nextUserIsSame) {
                  MessageBubble.next(
                      message: chatMessage["text"],
                      isMe: currentMessageUserId == authenticatedUserId);
                } else {
                  MessageBubble.first(
                      username: chatMessage["username"],
                      userImage: chatMessage["imageUrl"],
                      message: chatMessage["text"],
                      isMe: currentMessageUserId == authenticatedUserId);
                }
              });
        });
  }
}
