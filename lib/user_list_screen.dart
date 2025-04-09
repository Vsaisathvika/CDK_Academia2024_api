import 'package:flutter/material.dart';
import 'user.dart';
import 'edit_user_screen.dart';
import 'create_user_screen.dart';
import 'delete_confirmation_dialog.dart';

class UserListScreen extends StatelessWidget {
  final List<User> users;
  final Function(String, String) onAddUser;
  final Function(int, String, String) onUpdateUser;
  final Function(int) onDeleteUser;

  UserListScreen({
    required this.users,
    required this.onAddUser,
    required this.onUpdateUser,
    required this.onDeleteUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
        backgroundColor: Colors.black,
        centerTitle: false,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 80),
        itemCount: users.length,
        itemBuilder: (context, index) {
          var user = users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Edit Icon
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    final updatedUser = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditUserScreen(
                          name: user.name,
                          email: user.email,
                        ),
                      ),
                    );
                    if (updatedUser != null) {
                      onUpdateUser(index, updatedUser["name"], updatedUser["email"]);
                    }
                  },
                ),
                // Delete Icon with Confirmation
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    bool confirmDelete = await showDeleteConfirmationDialog(context);
                    if (confirmDelete) {
                      onDeleteUser(index);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newUser = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateUserScreen()),
          );
          if (newUser != null) {
            onAddUser(newUser["name"], newUser["email"]);
          }
        },
      ),
    );
  }
}
