import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korovina_sksm_24_1/models/department.dart';
import 'package:korovina_sksm_24_1/providers/students_provider.dart';

class DepartmentGridItem extends ConsumerWidget {
  const DepartmentGridItem({super.key, required this.department});

  final Department department;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ref.watch(studentsProvider);
    final amount = students
        .where((student) => student.departmentId == department.id)
        .length;
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            department.color.withOpacity(0.55),
            department.color.withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            department.name,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          Text(
            'Students enrolled : $amount',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          Row(
            children: [
              const Spacer(),
              Icon(department.icon),
            ],
          ),
        ],
      ),
    );
  }
}
