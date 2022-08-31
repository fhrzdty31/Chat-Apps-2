import 'chat.dart';
import 'group.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.chat_outlined),
          title: const Text("Chat App"),
          actions: [
            const Icon(Icons.search),
            Container(
              width: 15,
            )
          ],
          bottom: TabBar(
            tabs: myTabs,
            indicatorWeight: 4.5,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
        body: const TabBarView(
          children: [Chat(), Group()],
        ),
      ),
    );
  }

  List<Tab> myTabs = [
    const Tab(
      text: "Chat",
    ),
    const Tab(
      text: "Group",
    )
  ];
}
