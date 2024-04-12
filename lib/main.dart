import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:whatsapp/tabs/call.dart';
import 'package:whatsapp/tabs/camera.dart';
import 'package:whatsapp/tabs/chat.dart';
import 'package:whatsapp/tabs/status.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myApp(),
    ));

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WhatsApp",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal.shade700,
        actions: [
          IconButton(
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.camera_enhance_outlined,
                color: Colors.white,
              ),
            ),
            Tab(
              child: Text(
                'CHATS',
                style: TextStyle(color: Colors.white), // Set text color
              ),
            ),
            Tab(
              child: Text(
                'STATUS',
                style: TextStyle(color: Colors.white), // Set text color
              ),
            ),
            Tab(
              child: Text(
                'CALLS',
                style: TextStyle(color: Colors.white), // Set text color
              ),
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[new camera(), new chat(), new Status(), new call()],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              backgroundColor: Colors.teal.shade700,
            )
          : _tabController.index == 1
              ? FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.teal.shade700,
                )
              : _tabController.index == 2
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                          SizedBox(
                            height: 45.0,
                            width: 45.0,
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.edit,
                                color: Colors.teal.shade700,
                              ),
                              backgroundColor: Colors.teal.shade50,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.teal.shade700,
                          )
                        ])
                  : FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.add_ic_call_rounded,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.teal.shade700,
                    ),
    );
  }
}
