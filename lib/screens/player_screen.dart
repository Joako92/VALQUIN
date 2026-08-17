import 'package:flutter/material.dart';

import '../data/player.dart';
import '../widgets/attribute_card.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOLO TRAINING'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // --------------------------------------------------
            // PLAYER CARD
            // --------------------------------------------------

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xFF111827),

                borderRadius: BorderRadius.circular(20),

                border: Border.all(
                  color: Colors.blueAccent.withOpacity(0.5),
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.15),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),

              child: Column(
                children: [
                  const Text(
                    'PLAYER',

                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 3,
                      color: Colors.white54,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    player.name,

                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    player.playerClass.name.toUpperCase(),

                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'LEVEL ${player.level}',

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),

                    child: LinearProgressIndicator(
                      // value: player.xp / 100,
                      value: player.xpForCurrentLevel / player.xpRequiredForLevel,
                      minHeight: 12,
                      backgroundColor: Colors.white12,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(
                        Colors.blueAccent,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Text(
                  //   '${player.xp} / 100 XP',
                  Text(
                    '${player.xpForCurrentLevel}/${player.xpRequiredForLevel} XP',

                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // --------------------------------------------------
            // ATTRIBUTES
            // --------------------------------------------------

            const Align(
              alignment: Alignment.centerLeft,

              child: Text(
                'ATTRIBUTES',

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: AttributeCard(
                    name: 'STRENGTH',
                    value: player.stats.strength,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: AttributeCard(
                    name: 'ENDURANCE',
                    value: player.stats.endurance,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: AttributeCard(
                    name: 'ENERGY',
                    value: player.stats.energy,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: AttributeCard(
                    name: 'STAMINA',
                    value: player.stats.stamina,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}