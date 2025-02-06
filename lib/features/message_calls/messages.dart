import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/bottom_navigation.dart';
import 'package:med_meet_flutter/features/message_calls/components/message_tile.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: ListView(
          children: [
            MessageTile(),
            MessageTile(),
            MessageTile(),
            MessageTile(),
            MessageTile(),
            MessageTile(),
            MessageTile(),
            MessageTile(),
            MessageTile(),
            MessageTile(),
            MessageTile(),
            MessageTile(),
            MessageTile(),
            MessageTile(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        menuIndex: 2,
      ),
    );
  }
}
