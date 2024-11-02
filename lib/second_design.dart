import 'package:flutter/material.dart';

class SecondDesign extends StatefulWidget {
  const SecondDesign({super.key});

  @override
  State<SecondDesign> createState() => _SecondDesignState();
}

class _SecondDesignState extends State<SecondDesign> {
  int _selectedIndex = 0; // Index for BottomNavigationBar

  // List of widgets to display based on the selected index
  final List<Widget> _pages = [
    ChatsPage(),
    StatusPage(),
    CommunitiesPage(),
    CallsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WhatsApp UI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(30), // Custom height
            child: AppBar(
            ),
          ),
          body: _pages[_selectedIndex], // Display the selected page
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat, color: Colors.black),
                label: "Chats",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.update, color: Colors.black),
                label: "Updates",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_alt, color: Colors.black),
                label: "Communities",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.call, color: Colors.black),
                label: "Calls",
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index; // Update selected index
              });
            },
          ),
        ),
      ),

    );

  }
}
 Widget container(double width, String text, double screenWidth) {
return Container(
width: width,
height: screenWidth * 0.12, // Responsive height based on screen width
decoration: BoxDecoration(
color: Colors.grey.shade100,
borderRadius: BorderRadius.circular(screenWidth * 0.05),
),
child: Center(
child: Text(
text,
style: TextStyle(fontSize: screenWidth * 0.045), // Responsive font size
),
),
);
}

// Chats Page
class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen height and width
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.02),
              child: Top(
                text: "WhatsApp",
                textStyle: TextStyle(
                  color: Colors.green,
                  fontSize: screenWidth * 0.07, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
                icons: [
                  Icon(Icons.camera_alt, size: screenWidth * 0.07),
                  Icon(Icons.more_vert_outlined, size: screenWidth * 0.07),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              width: screenWidth * 0.9, // Responsive width
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  prefixIcon: Icon(Icons.circle, size: screenWidth * 0.07),
                  hintText: "Ask Meta AI or Search",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                container(screenWidth * 0.2, "All", screenWidth),
                container(screenWidth * 0.25, "Unread", screenWidth),
                container(screenWidth * 0.3, "Favourites", screenWidth),
                container(screenWidth * 0.25, "Groups", screenWidth),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: screenWidth * 0.06,
                      backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/7/71/Osman_Khalid_Butt.jpg",
                      ),
                    ),
                    title: Text(
                      "Contact $index",
                      style: TextStyle(fontSize: screenWidth * 0.045),
                    ),
                    subtitle: Row(
                      children: [
                        Icon(Icons.done_all, size: screenWidth * 0.04, color: Colors.blue),
                        SizedBox(width: screenWidth * 0.01),
                        Expanded(
                          child: Text(
                            "Last message preview goes here",
                            style: TextStyle(fontSize: screenWidth * 0.04),
                          ),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("10:30 AM", style: TextStyle(fontSize: screenWidth * 0.03)),
                        CircleAvatar(
                          radius: screenWidth * 0.02,
                          backgroundColor: Colors.teal,
                          child: Text(
                            "1",
                            style: TextStyle(fontSize: screenWidth * 0.025, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          bottom: screenHeight * 0.03,
          right: screenWidth * 0.05,
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add, size: screenWidth * 0.07),
            backgroundColor: Colors.teal,
          ),
        ),
      ],
    );
  }}

// Status Page
class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left :8.0),
      child: Stack(
        children: [Column(
          children: [
            const Top(
              text: "Updates",
              textStyle: TextStyle(fontSize: 24),
              icons: [
                Icon(Icons.camera_alt),
                Icon(Icons.search),
                Icon(Icons.more_vert_outlined),
              ],
            ),
            const SizedBox(height: 35),
            const Top(
              text: "Status",
              textStyle: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 15),
            ListView(
              shrinkWrap: true,
              children:  [
                ListTile(
                  leading: Stack(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/7/71/Osman_Khalid_Butt.jpg"),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 25,
                        child: Container(
                          height: 25,
                          width: 25,
                          child: const CircleAvatar(
                            backgroundColor: Colors.teal,
                            child: Center(child: Icon(Icons.add)),
                          ),
                        ),
                      )
                    ],
                  ),
                  title: const Text(
                    "My Status",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("Tap to add status update"),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Top(text: "Recent updates", textStyle: TextStyle(fontSize: 14)),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/7/71/Osman_Khalid_Butt.jpg"),
                    ),
                    title: Text("Usman"),
                    subtitle: Text("1:30 am"),
                  );
                },
              ),
            ),
          ],
        ),
          Positioned(
          bottom: 10,
          right: 30,
    child: Column(
      children: [
        FloatingActionButton(onPressed: (){} ,
        child: Icon(Icons.edit,color:Colors.black , ),
        ),
        SizedBox(height: 10,),
        FloatingActionButton(onPressed: (){} ,
          child: Icon(Icons.camera_alt, ),backgroundColor: Colors.teal,
        ),

      ],
    ))
    ]
      ),
    );
  }
}

// Communities Page
class CommunitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white10,
        child: Column(
          children: [
            Top(text: "Communities", textStyle: TextStyle(
              fontSize: 29 , fontWeight: FontWeight.bold
            )),
            Container(
              height: 80,
              width: 400,
              child:   Padding(
                padding: const EdgeInsets.only(left: 8.0 ,top:  15),
                child: ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage("data:image/png;base64,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"),
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
                  title: const Text("Add New Community",style: TextStyle(
                    fontSize: 19
                  ),),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Calls Page
class CallsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Stack(
        children: [Column(
          children: [
            const Top(
              text: "Calls",
              textStyle: TextStyle(fontSize: 24),
              icons: [
                Icon(Icons.camera_alt),
                Icon(Icons.search),
                Icon(Icons.more_vert_outlined),
              ],
            ),
            const SizedBox(height: 40,),
             const Top(text: "Recent", textStyle: TextStyle(fontSize: 19)),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/7/71/Osman_Khalid_Butt.jpg"),
                    ),
                    title: Text("Contact $index"),
                    subtitle: Row(
                      children: [
                        Icon(
                          index % 2 == 0 ? Icons.call_received : Icons.call_made,
                          size: 16,
                          color: index % 2 == 0 ? Colors.red : Colors.green,
                        ),
                        const SizedBox(width: 4),
                        Text(index % 2 == 0 ? "Incoming" : "Outgoing"),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.call,
                      color: Colors.teal,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
          Positioned(
              bottom: 30,
              right: 35,
              child: FloatingActionButton(onPressed: (){} ,
                child: Icon(Icons.phone, ),backgroundColor: Colors.teal,
              )),]
      ),
    );
  }
}

// Custom Top Widget for headers
class Top extends StatelessWidget {
  const Top({
    super.key,
    required this.text,
    required this.textStyle,
    this.icons = const [],
  });
  final String text;
  final TextStyle textStyle;
  final List<Icon> icons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: textStyle),
        const Spacer(),
        ...icons.map((icon) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: icon,
        )),
      ],
    );
  }
}
