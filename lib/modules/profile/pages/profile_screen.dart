import 'package:aurate/export.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.go('/setting');
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
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                tileColor: Theme.of(context).colorScheme.secondary,
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
