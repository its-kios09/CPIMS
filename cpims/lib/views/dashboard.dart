import 'package:cpims/views/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:unicons/unicons.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  Map<String, dynamic>? _dashboardData;

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

    if (response.statusCode == 200) {
      setState(() {
        _dashboardData = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to fetch dashboard data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Dashboard Summaries: ',
            style: TextStyle(fontFamily: 'JosefinSans', color: Colors.white),
          ),
        ),
        backgroundColor: Colors.cyan[700],
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text(
                    "Log out",
                    style: TextStyle(fontFamily: 'JosefinSans', fontSize: 18),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: _dashboardData != null
          ? ListView(
              children: [
                const SizedBox(height: 20),
                Center(
                    child: Text(
                        "Organization unit: ${_dashboardData!['org_unit']}",
                        style: const TextStyle(
                            fontFamily: 'JosefinSans', fontSize: 18))),
                const SizedBox(height: 10),
                Center(
                    child: Text(
                        "Organization Unit ID: ${_dashboardData!['org_unit_id']}",
                        style: const TextStyle(
                            fontFamily: 'JosefinSans', fontSize: 18))),
                Container(
                  decoration: BoxDecoration(
                    // Replace with your desired background color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.all(10), // Add padding to the Container
                  child: Card(
                    elevation: 4, // Adjust the elevation as needed
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(
                          10), // Add content padding to the ListTile
                      leading: const Icon(
                        UniconsLine.kid,
                        size: 50,
                        color: Colors.amber,
                      ),
                      title: const Text(
                        'Children | Caregivers',
                        style:
                            TextStyle(fontFamily: 'JosefinSans', fontSize: 18),
                      ),
                      subtitle: Text(
                        ' ${_dashboardData!['children']} | ${_dashboardData!['caregivers']}',
                        style: const TextStyle(
                          fontFamily: 'JosefinSans',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // Replace with your desired background color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.all(10), // Add padding to the Container
                  child: Card(
                    elevation: 4, // Adjust the elevation as needed
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(
                          10), // Add content padding to the ListTile
                      leading: const Icon(
                        UniconsLine.building,
                        size: 50,
                        color: Colors.lightGreen,
                      ),
                      title: const Text('NGO | Government',
                          style: TextStyle(
                              fontFamily: 'JosefinSans', fontSize: 18)),
                      subtitle: Text(
                        ' ${_dashboardData!['ngo']} | ${_dashboardData!['government']}',
                        style: const TextStyle(
                            fontFamily: 'JosefinSans', fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // Replace with your desired background color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.all(10), // Add padding to the Container
                  child: Card(
                    elevation: 4, // Adjust the elevation as needed
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(
                          10), // Add content padding to the ListTile
                      leading: const Icon(
                        UniconsLine.books,
                        size: 50,
                        color: Colors.indigo,
                      ),
                      title: const Text('Case Records | Pending Cases',
                          style: TextStyle(
                              fontFamily: 'JosefinSans', fontSize: 18)),
                      subtitle: Text(
                        ' ${_dashboardData!['case_records']} | ${_dashboardData!['pending_cases']}',
                        style: const TextStyle(
                            fontFamily: 'JosefinSans', fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // Replace with your desired background color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.all(10), // Add padding to the Container
                  child: Card(
                    elevation: 4, // Adjust the elevation as needed
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(
                          10), // Add content padding to the ListTile
                      leading: const Icon(
                        UniconsLine.house_user,
                        size: 50,
                        color: Colors.pink,
                      ),
                      title: const Text('All Children | Household',
                          style: TextStyle(
                              fontFamily: 'JosefinSans', fontSize: 18)),
                      subtitle: Text(
                        ' ${_dashboardData!['children_all']} | ${_dashboardData!['household']}',
                        style: const TextStyle(
                            fontFamily: 'JosefinSans', fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
