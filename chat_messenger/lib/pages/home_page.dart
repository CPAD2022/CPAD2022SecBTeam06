import 'package:chat_messenger/providers/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.ref});
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: signOut, child: const Text("Sign Out")),
    );
  }

  void signOut() async {
    FirebaseDatabase db = ref.watch(databaseProvider)!;
    print(db.databaseURL);
    print((await db.ref('id').get()).value);
    final authProvider = ref.watch(authenticationProvider);
    authProvider.signOut();
  }
}
