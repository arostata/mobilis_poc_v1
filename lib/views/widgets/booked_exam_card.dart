import 'package:flutter/material.dart';
import 'package:mobilis_poc_v1/views/widgets/exam_details_sheet.dart';

class BookedExamCard extends StatelessWidget {
  final String title;
  final String duration;
  final String date;
  final String time;
  final String type;
  final String status;
  final List<String> platformCompatibility;

  const BookedExamCard({
    super.key,
    required this.title,
    required this.duration,
    required this.date,
    required this.time,
    required this.type,
    required this.status,
    required this.platformCompatibility,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Status Row
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 10),
                _buildStatusBadge(status),
              ],
            ),
            // Duration of Exam
            Text(
              "Duration: $duration",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),

            // More Info and Action Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // More Info Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date: $date",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "Time: $time",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "Type: $type",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                // Action Buttons Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (status == "Available")
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // Set corner radius to 8
                          ),
                        ),
                        child: const Text("Launch Exam"),
                      )
                    else
                      ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.grey[600],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // Set corner radius to 8
                          ),
                        ),
                        child: const Text("Not Available"),
                      ),
                    OutlinedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled:
                              true, // Allow the sheet to expand fully
                          isDismissible:
                              true, // Enable dismissal by tapping outside
                          enableDrag: true, // Allow dragging to dismiss
                          backgroundColor:
                              Colors
                                  .transparent, // Make the background transparent
                          builder:
                              (context) => ExamDetailsSheet(
                                title: title,
                                duration: duration,
                                dateRegistered: date,
                                time: time,
                                dateScheduled: date,
                                deliveryType: type,
                                status: status,
                                platformCompatibility: platformCompatibility,
                              ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF444444),
                        side: const BorderSide(
                          color: Color(
                            0xFFD7D7D7,
                          ), // Set outline color to #D7D7D7
                          width: 1.0, // Set border width
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Exam Details"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Status Badge Widget
  Widget _buildStatusBadge(String status) {
    Color badgeColor;
    Color textColor;

    switch (status) {
      case "Available":
        badgeColor = Colors.deepPurple.shade50;
        textColor = Colors.deepPurple;
        break;
      case "Expired" || "Suspended":
        badgeColor = const Color(0xFFF1EDED); // Background color for "Expired"
        textColor = const Color(0xFFC55E60); // Text color for "Expired"
        break;
      case "Upcoming" || "Incompatible":
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
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
