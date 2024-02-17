import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/colors.dart';

class ActivityComponent extends StatelessWidget {
  final DateTime date;
  final String type;
  const ActivityComponent({
    super.key,
    required this.date,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        type == 'In'
            ? Container(
                margin: const EdgeInsets.all(8.0),
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: appSecondaryBackgroundColor,
                ),
                child: Column(
                  children: [
                    Text(
                      date.day.toString(),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      DateFormat('E').format(date),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            : Container(
                margin: const EdgeInsets.all(8.0),
                height: 70,
                width: 70,
              ),
        Column(
          children: [
            type == 'In'
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    width: MediaQuery.of(context).size.width * 0.75,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: white,
                      // efek shadow tipis
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Masuk',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              // '07.59',
                              DateFormat('HH:mm').format(date),
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.pin_drop,
                                  size: 18,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 3),
                                Icon(
                                  Icons.calendar_month,
                                  size: 18,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 3),
                                Icon(
                                  Icons.note_add,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    width: MediaQuery.of(context).size.width * 0.75,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: white,
                      // efek shadow tipis
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Keluar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('HH:mm').format(date),
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.pin_drop,
                                  size: 18,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 3),
                                Icon(
                                  Icons.note_add,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
