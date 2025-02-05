import 'package:flutter/material.dart';

class SearchUserView extends StatelessWidget {
  const SearchUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Text('Search'),
      ),
    );
  }
}
