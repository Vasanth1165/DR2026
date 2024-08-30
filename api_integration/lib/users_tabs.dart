import 'dart:html';

import 'package:api_integration/users_page.dart';
import 'package:flutter/material.dart';

class UserTabs extends StatefulWidget {
  const UserTabs({super.key});

  @override
  State<UserTabs> createState() => _UserTabsState();
}

class _UserTabsState extends State<UserTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, child: Scaffold(
      appBar: AppBar(
        title: Text("List of Users Pages"),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(text: "Page1",),
            Tab(text: "Page2",)
          ],
        ),
      ),
      body: TabBarView(
        children: [
          UsersPage(page: 1),
          UsersPage(page: 2)
        ],
      ),
    ));
  }
}
