import 'package:flutter/material.dart';
import 'package:mobilis_poc_v1/views/screens/sign_in_screen.dart';
import 'package:mobilis_poc_v1/views/widgets/booked_exam_card.dart';

class MyAssessmentScreen extends StatefulWidget {
  const MyAssessmentScreen({super.key});

  @override
  State<MyAssessmentScreen> createState() => _MyAssessmentScreenState();
}

class _MyAssessmentScreenState extends State<MyAssessmentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3, // Adjusted for your tabs
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true, // Enables floating behavior for SliverAppBar
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                "My Assessment",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600, // Slightly thicker font
                ),
              ),
              centerTitle: true,
              pinned: true, // Keeps the AppBar visible when collapsed
              floating: true, // Makes the AppBar appear when scrolling up
              snap: true, // Ensures the AppBar snaps fully into view
              forceElevated: innerBoxIsScrolled, // Adds elevation when scrolled
              scrolledUnderElevation: 4, // Material 3 shadow effect
              actions: [
                TextButton(
                  onPressed: _handleLogout,
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Theme.of(context).colorScheme.primary,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(text: "Booked Exam"),
                  Tab(text: "In Progress"),
                  Tab(text: "Completed"),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildBookedExamList(),
            _buildEmptyPage("No in-progress exams."),
            _buildEmptyPage("No completed exams."),
          ],
        ),
      ),
    );
  }

  /// Logout Action
  void _handleLogout() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  /// Booked Exam List
  Widget _buildBookedExamList() {
    final List<Map<String, dynamic>> exams = [
      {
        'title': 'Mathematics Final Mathematics Final',
        'duration': '2 hours',
        'date': 'Jan 20, 2025',
        'time': '09:00 AM',
        'type': 'Unproctored',
        'status': 'Available',
        'platformCompatibility': ['mobile', 'computer'],
      },
      {
        'title': 'Mathematics Final',
        'duration': '2 hours',
        'date': 'Jan 20, 2025',
        'time': '09:00 AM',
        'type': 'Unproctored',
        'status': 'Incompatible',
        'platformCompatibility': ['computer'],
      },
      {
        'title': 'Physics Midterm',
        'duration': '1.5 hours',
        'date': 'Sept 28, 2024',
        'time': '02:00 PM',
        'type': 'Unproctored',
        'status': 'Expired',
        'platformCompatibility': ['mobile', 'computer'],
      },
      {
        'title': 'Chemistry Quiz',
        'duration': '45 Minutes',
        'date': 'Feb 28, 2025',
        'time': '11:30 AM',
        'type': 'Unproctored',
        'status': 'Upcoming',
        'platformCompatibility': ['mobile'],
      },
      {
        'title': 'Mathematics Final',
        'duration': '2 hours',
        'date': 'Jan 20, 2025',
        'time': '09:00 AM',
        'type': 'Unproctored',
        'status': 'Suspended',
        'platformCompatibility': ['mobile', 'computer'],
      },
      {
        'title': 'Physics Midterm',
        'duration': '1.5 hours',
        'date': 'Sept 28, 2024',
        'time': '02:00 PM',
        'type': 'Unproctored',
        'status': 'Expired',
        'platformCompatibility': ['mobile', 'computer'],
      },
      {
        'title': 'Chemistry Quiz',
        'duration': '45 Minutes',
        'date': 'Feb 28, 2025',
        'time': '11:30 AM',
        'type': 'Unproctored',
        'status': 'Upcoming',
        'platformCompatibility': ['mobile', 'computer'],
      },
      {
        'title': 'Mathematics Final',
        'duration': '2 hours',
        'date': 'Jan 20, 2025',
        'time': '09:00 AM',
        'type': 'Unproctored',
        'status': 'Incompatible',
        'platformCompatibility': ['computer'],
      },
      {
        'title': 'Physics Midterm',
        'duration': '1.5 hours',
        'date': 'Sept 28, 2024',
        'time': '02:00 PM',
        'type': 'Unproctored',
        'status': 'Expired',
        'platformCompatibility': ['mobile', 'computer'],
      },
      {
        'title': 'Chemistry Quiz',
        'duration': '45 Minutes',
        'date': 'Feb 28, 2025',
        'time': '11:30 AM',
        'type': 'Unproctored',
        'status': 'Upcoming',
        'platformCompatibility': ['mobile', 'computer'],
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: exams.length,
      itemBuilder: (context, index) {
        final exam = exams[index];
        return BookedExamCard(
          title: exam['title'],
          duration: exam['duration'],
          date: exam['date'],
          time: exam['time'],
          type: exam['type'],
          status: exam['status'],
          platformCompatibility: exam['platformCompatibility'],
        );
      },
    );
  }

  /// Status Badge Widget
  Widget _buildStatusBadge(String status) {
    Color badgeColor;
    Color textColor;

    switch (status) {
      case "Available":
        badgeColor = Colors.deepPurple.shade100;
        textColor = Colors.deepPurple;
        break;
      case "Expired":
        badgeColor = Colors.red.shade100;
        textColor = Colors.red;
        break;
      case "Upcoming":
        badgeColor = Colors.grey.shade300;
        textColor = Colors.grey;
        break;
      default:
        badgeColor = Colors.black12;
        textColor = Colors.black;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  /// Empty Page Placeholder
  Widget _buildEmptyPage(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
