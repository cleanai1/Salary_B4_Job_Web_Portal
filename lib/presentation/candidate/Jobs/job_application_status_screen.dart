import 'package:flutter/material.dart';
import 'package:salary_b4_job_web_portal/presentation/candidate/Jobs/sections/applied_job_card.dart';
import '../../../widgets/navigation_bar.dart';
import 'sections/applied_job_section.dart';
import 'sections/applied_job_status_section.dart';

class JobApplicationStatusScreen extends StatefulWidget {
  const JobApplicationStatusScreen({super.key});

  @override
  _JobApplicationStatusScreenState createState() =>
      _JobApplicationStatusScreenState();
}

class _JobApplicationStatusScreenState
    extends State<JobApplicationStatusScreen> {
  AppliedJob? selectedJob;

  // Initialize selectedJob with the first job when the screen is built
  @override
  void initState() {
    super.initState();
    selectedJob = AppliedJob(
      jobTitle: 'Python Developer',
      company: 'SmartWorks Technologies.',
    );
  }

  void _onJobCardSelected(AppliedJob job) {
    setState(() {
      if (selectedJob == job) {
        selectedJob = null; // Deselect if the same job is tapped again
      } else {
        selectedJob = job; // Select the tapped job
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const MyAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 30,
                    child: AppliedJobSection(
                      onJobSelected: _onJobCardSelected,
                      selectedJob: selectedJob,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    flex: 70,
                    child: selectedJob != null
                        ? AppliedJobStatusSection(
                            job:
                                selectedJob!) // Render if selectedJob is not null
                        : const SizedBox(
                            height:
                                80), // Placeholder widget or other content if selectedJob is null
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppliedJob {
  final String jobTitle;
  final String company;

  AppliedJob({
    required this.jobTitle,
    required this.company,
  });
}
