import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  ThirdScreenState createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen> {
  List users = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;

  Future<void> fetchUsers({int page = 1}) async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    final response = await http
        .get(Uri.parse('https://reqres.in/api/users?page=$page&per_page=10'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['data'] != null) {
        setState(() {
          users.addAll(data['data']);
          currentPage = page;
          hasMore = data['data'].length == 10;
        });
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void onUserTap(String userName) {
    Navigator.pop(context, userName);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: Text(
          'Third Screen',
          style: theme.textTheme.headlineSmall,
        ),
      ),
      body: users.isEmpty
          ? const Center(child: Text('No data available'))
          : NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (!isLoading &&
                    hasMore &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  fetchUsers(page: currentPage + 1);
                }
                return false;
              },
              child: RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    users.clear();
                    currentPage = 1;
                  });
                  fetchUsers();
                },
                child: ListView.builder(
                  itemCount: users.length + (isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == users.length) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final user = users[index];
                    return ListTile(
                      dense: false,
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(user['avatar']),
                      ),
                      title: Text('${user['first_name']} ${user['last_name']}'),
                      subtitle: Text(user['email']),
                      onTap: () => onUserTap(
                          '${user['first_name']} ${user['last_name']}'),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
