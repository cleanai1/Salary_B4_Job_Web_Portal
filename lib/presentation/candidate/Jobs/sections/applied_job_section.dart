import 'package:flutter/material.dart';
import '../job_application_status_screen.dart';
import 'applied_job_card.dart';

class AppliedJobSection extends StatelessWidget {
  final Function(AppliedJob) onJobSelected;
  final AppliedJob? selectedJob;

  const AppliedJobSection({
    super.key,
    required this.onJobSelected,
    required this.selectedJob,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppliedJobCard(
            jobTitle: 'Python Developer',
            company: 'SmartWorks Technologies.',
            isSelected: selectedJob?.jobTitle == 'Python Developer',
            onCardTap: () {
              onJobSelected(AppliedJob(
                jobTitle: 'Python Developer',
                company: 'SmartWorks Technologies.',
              ));
            },
          ),
          // const Divider(thickness: 1, height: 30),
          AppliedJobCard(
            jobTitle: 'Python Developer 1',
            company: 'SmartWorks Technologies 1.',
            isSelected: selectedJob?.jobTitle == 'Python Developer 1',
            onCardTap: () {
              onJobSelected(AppliedJob(
                jobTitle: 'Python Developer 1',
                company: 'SmartWorks Technologies 1.',
              ));
            },
          ),
          // const Divider(thickness: 1, height: 30),
          AppliedJobCard(
            jobTitle: 'Python Developer 2',
            company: 'SmartWorks Technologies 2.',
            isSelected: selectedJob?.jobTitle == 'Python Developer 2',
            onCardTap: () {
              onJobSelected(AppliedJob(
                jobTitle: 'Python Developer 2',
                company: 'SmartWorks Technologies 2.',
              ));
            },
          ),
          // const Divider(thickness: 1, height: 30),
        ],
      ),
    );
  }
}
