import 'package:ecobrick_app/app/modules/guru/guruhome/views/pie_page.dart';
import 'package:flutter/material.dart';

import 'bar_page.dart';
import 'candle_page.dart';
import 'group_bar_page.dart';
import 'line_page.dart';

class MainGrafikTes extends StatelessWidget {
  const MainGrafikTes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyMenu(context),
    );
  }

  Column bodyMenu(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const BarPage(),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF1B0E41),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Bar haahahah'),
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const GroupBarPage(),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF1B0E41),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Group bar'),
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const CandlePage(),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF1B0E41),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Candle'),
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const LinePage(),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF1B0E41),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Line'),
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const PiePage(),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF1B0E41),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Pie'),
          ),
        ),
      ],
    );
  }
}
