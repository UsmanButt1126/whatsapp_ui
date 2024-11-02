import 'package:flutter/material.dart';
import 'package:whatsapp_ui/second_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WhatsApp Clone",
      theme: ThemeData(
        primaryColor: Colors.teal[800],
      ),
      home:  SecondDesign(),
    );
  }
}

class WhatsAppHome extends StatelessWidget {
  const WhatsAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[800],
          title: const Text("WhatsApp", style: TextStyle(fontSize: 22)),
          actions: [
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(

            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.people)), // Communities icon
              Tab(text: "Chats", ),
              Tab(text: "Status"),
              Tab(text: "Calls"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCommunitiesTab(),
            _buildChatsTab(),
            _buildStatusTab(),
            _buildCallsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunitiesTab() {
    return Center(
      child: Text(
        "Communities Feature Coming Soon",
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
    );
  }

  Widget _buildChatsTab() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://via.placeholder.com/150"),
          ),
          title: Text("Contact $index"),
          subtitle: Row(
            children: [
              Icon(Icons.done_all, size: 16, color: Colors.blue),
              SizedBox(width: 4),
              Expanded(child: Text("Last message preview goes here")),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("10:30 AM", style: TextStyle(fontSize: 12)),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.teal,
                child: Text("1", style: TextStyle(fontSize: 10, color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatusTab() {
    return ListView(
      children: [
        ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://via.placeholder.com/150"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 10,
                  child: Icon(Icons.add, size: 15, color: Colors.white),
                ),
              ),
            ],
          ),
          title: const Text("My Status"),
          subtitle: const Text("Tap to add status update"),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Recent updates"),
        ),
        _buildStatusUpdateTile("Contact 1"),
        _buildStatusUpdateTile("Contact 2"),
      ],
    );
  }

  Widget _buildStatusUpdateTile(String contactName) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage("https://via.placeholder.com/150"),
      ),
      title: Text(contactName),
      subtitle: Text("Today, 10:00 AM"),
    );
  }

  Widget _buildCallsTab() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://via.placeholder.com/150"),
          ),
          title: Text("Contact $index"),
          subtitle: Row(
            children: [
              Icon(
                index % 2 == 0 ? Icons.call_received : Icons.call_made,
                size: 16,
                color: index % 2 == 0 ? Colors.red : Colors.green,
              ),
              SizedBox(width: 4),
              Text(index % 2 == 0 ? "Incoming" : "Outgoing"),
            ],
          ),
          trailing: Icon(
            Icons.call,
            color: Colors.teal,
          ),
        );
      },
    );
  }
}
