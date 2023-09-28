import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_3/ui/messages.dart';
import 'package:tugas_3/ui/profile.dart';
import 'package:tugas_3/ui/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _username;

  void _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString("username");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Text(
          "Welcome back $_username",
          style: const TextStyle(fontSize: 24),
        ),
      ),
      drawer: Drawer(
          child: ListView(children: [
        DrawerHeader(
            child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://bit.ly/dan-abramov"),
            ),
            Text(_username)
          ],
        )),
        ListTile(
          leading: const Icon(Icons.person_2_outlined),
          title: const Text("Profile"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.mail_outline_rounded),
          title: const Text("Messages"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Messages()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text("Settings"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
          },
        )
      ])),
    );
  }
}
