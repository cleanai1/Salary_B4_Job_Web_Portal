// import 'package:flutter/material.dart';

// class ApplicationStatusStepper extends StatelessWidget {
//   final DateTime appliedDate;
//   final DateTime sentDate;

//   const ApplicationStatusStepper({
//     super.key,
//     required this.appliedDate,
//     required this.sentDate,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stepper(
//       steps: [
//         Step(
//           title: Text('Applied (${_formatDate(appliedDate)})'),
//           subtitle: const Text('Application sent'),
//           content: const SizedBox.shrink(),
//           isActive: true,
//         ),
//         Step(
//           title: Text('Application Sent (${_formatDate(sentDate)})'),
//           subtitle: const Text('Awaiting Recruiter Action'),
//           content: const SizedBox.shrink(),
//           isActive: true,
//         ),
//       ],
//       physics: const ScrollPhysics(),
//       controlsBuilder: (BuildContext context,
//           {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
//         return const SizedBox.shrink();
//       },
//       type: StepperType.horizontal,
//     );
//   }

//   String _formatDate(DateTime date) {
//     return '${date.day}/${date.month}/${date.year}';
//   }
// }
