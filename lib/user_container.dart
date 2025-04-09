import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';
import 'user_list_screen.dart';

class UserContainer extends StatefulWidget {
  @override
  _UserContainerState createState() => _UserContainerState();
}

class _UserContainerState extends State<UserContainer> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response =
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      setState(() {
        users = (json.decode(response.body) as List)
            .map((data) => User.fromJson(data))
            .toList();
      });
    }
  }

  void addUser(String name, String email) {
    setState(() {
      users.insert(0, User(name: name, email: email));
    });
  }

  void updateUser(int index, String name, String email) {
    setState(() {
      users[index].name = name;
      users[index].email = email;
    });
  }

  void deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return UserListScreen(
      users: users,
      onAddUser: addUser,
      onUpdateUser: updateUser,
      onDeleteUser: deleteUser,
    );
  }
}
