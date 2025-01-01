import 'package:aurate/export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              //settings page goes here
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            spacing: 18.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.0),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    "${FirebaseAuth.instance.currentUser?.photoURL}"),
              ),
              InfoTiles(
                icon: Icons.person,
                title: "Username",
                subtitle: "${FirebaseAuth.instance.currentUser?.displayName}",
              ),
              InfoTiles(
                icon: Icons.email,
                title: "Email",
                subtitle: "${FirebaseAuth.instance.currentUser?.email}",
              ),
              InfoTiles(
                icon: Icons.add_business,
                title: "Organization",
                subtitle: "[organization]",
              ),
              ListTile(
                onTap: () {
                  DialogBuilder.build(
                    context,
                    title: "Are you sure?",
                    content:
                        "This action will log you out of the current session",
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          context.pop();
                          AuthServices.signOut();
                        },
                        child: Text("Continue"),
                      ),
                    ],
                  );
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                tileColor: Colors.yellow, //changes this in future for dark mode
                leading: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
