import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExamDetailsSheet extends StatefulWidget {
  final String title;
  final String status;
  final String duration;
  final String dateRegistered;
  final String dateScheduled;
  final String time;
  final String deliveryType;
  final List<String> platformCompatibility;

  const ExamDetailsSheet({
    super.key,
    required this.title,
    required this.status,
    required this.duration,
    required this.dateRegistered,
    required this.dateScheduled,
    required this.time,
    required this.deliveryType,
    required this.platformCompatibility,
  });

  @override
  State<ExamDetailsSheet> createState() => _ExamDetailsSheetState();
}

class _ExamDetailsSheetState extends State<ExamDetailsSheet> {
  @override
  Widget build(BuildContext context) {
    final platformInfo = _getPlatformInfo();
    return DraggableScrollableSheet(
      initialChildSize: 0.68, // Fully expanded by default
      minChildSize: 0.68, // Prevent shrinking
      maxChildSize: 0.9, // Prevent further expansion
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Drag Handle
                Container(
                  width: 40,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // Exam Details
                // Exam Details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildStatusBadge(widget.status),
                    const SizedBox(height: 8),
                    Text(
                      'Duration: ${widget.duration}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Date Registered: ${widget.dateRegistered}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Date Scheduled: ${widget.dateScheduled} | ${widget.time}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Delivery Type: ${widget.deliveryType}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    // NEW: Exam Platform Availability Section
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      /*decoration: BoxDecoration(
                        color:
                            Colors
                                .deepPurple
                                .shade50, // Light purple background
                        borderRadius: BorderRadius.circular(12),
                      ),*/
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            platformInfo['icon'],
                            color: Colors.grey.shade700,
                            size: 22,
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              platformInfo['text'],
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //const SizedBox(height: 12),
                // Action Buttons (Cupertino Style)
                Column(
                  children: [
                    // Launch Exam Button (Filled)
                    SizedBox(
                      width: double.infinity,
                      child:
                          widget.status == "Available"
                              ? CupertinoButton.filled(
                                borderRadius: BorderRadius.circular(14),
                                onPressed: () {
                                  // Launch Exam logic here
                                },
                                child: const Text(
                                  'Launch Exam',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600, // Semibold
                                  ),
                                ),
                              )
                              : CupertinoButton(
                                borderRadius: BorderRadius.circular(14),
                                color:
                                    CupertinoColors
                                        .systemGrey4, // Disabled button color
                                onPressed: null, // Disable the button
                                child: const Text(
                                  'Not Available',
                                  style: TextStyle(
                                    color:
                                        CupertinoColors
                                            .systemGrey, // Disabled text color
                                    fontWeight: FontWeight.w600, // Semibold
                                  ),
                                ),
                              ),
                    ),
                    const SizedBox(height: 8),

                    // Reschedule Button (Outlined)
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFD7D7D7), // Border color
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(14),
                          color:
                              Colors
                                  .transparent, // Transparent background for outline
                          onPressed: () {},
                          child: const Text(
                            'Reschedule',
                            style: TextStyle(
                              color: Color(0xFF1A1C29), // Text color
                              fontWeight: FontWeight.w600, // Semibold
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Cancel Registration Button (Outlined)
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFD7D7D7), // Border color
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(14),
                          color:
                              Colors
                                  .transparent, // Transparent background for outline
                          onPressed: () {},
                          child: const Text(
                            'Cancel Registration',
                            style: TextStyle(
                              color: Color(0xFF1A1C29), // Text color
                              fontWeight: FontWeight.w600, // Semibold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
        badgeColor = Colors.deepPurple.shade50;
        textColor = Colors.deepPurple;
        break;
      case "Expired":
      case "Suspended":
        badgeColor = const Color(0xFFF1EDED);
        textColor = const Color(0xFFC55E60);
        break;
      case "Upcoming":
      case "Incompatible":
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

  /// Determine platform availability based on `examCompatibility`
  Map<String, dynamic> _getPlatformInfo() {
    if (widget.platformCompatibility.contains('mobile') &&
        widget.platformCompatibility.contains('computer')) {
      return {
        'text':
            "You can take this exam on Mac, Windows, ChromeOS, iOS, and Android.",
        'icon': Icons.devices,
      };
    } else if (widget.platformCompatibility.contains('mobile')) {
      return {
        'text': "You can take this exam on iOS and Android.",
        'icon': Icons.smartphone,
      };
    } else if (widget.platformCompatibility.contains('computer')) {
      return {
        'text': "You can take this exam on Mac, Windows, and ChromeOS.",
        'icon': Icons.computer,
      };
    } else {
      return {
        'text': "This exam is not compatible with your device.",
        'icon': Icons.warning,
      };
    }
  }
}
