import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Map<String, dynamic> _dashboardData = {};

  @override
  void initState() {
    super.initState();
    _fetchDashboardData();
  }

  Future<void> _fetchDashboardData() async {
    final String? accessToken = await _storage.read(key: 'accessToken');

    final response = await http.get(
      Uri.parse("https://dev.cpims.net/api/dashboard/"),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
    // Log the response
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Dashboard'),
    ));
  }
}
