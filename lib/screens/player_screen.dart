import 'package:flutter/material.dart';

import '../managers/player_manager.dart';
import '../managers/class_manager.dart';
import '../models/player.dart';
import '../widgets/attribute_card.dart';

class PlayerScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final ClassManager classManager;

  const PlayerScreen({
    super.key,
    required this.playerManager,
    required this.classManager,
  });

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  // --------------------------------------------------
  // MANAGERS
  // --------------------------------------------------

  PlayerManager get playerManager => widget.playerManager;

  ClassManager get classManager => widget.classManager;

  // --------------------------------------------------
  // BUILD
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final player = playerManager.player;

    if (player == null) {
      return const Scaffold(
        body: Center(
          child: Text('PLAYER NOT LOADED'),
        ),
      );
    }

    final availableClasses =
        classManager.availableClasses(player);

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
                      value: player.xpForCurrentLevel /
                          player.xpRequiredForLevel,

                      minHeight: 12,

                      backgroundColor: Colors.white12,

                      valueColor:
                          const AlwaysStoppedAnimation<Color>(
                        Colors.blueAccent,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '${player.xpForCurrentLevel}/${player.xpRequiredForLevel} XP',

                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // --------------------------------------------------
            // CLASS CHANGE AVAILABLE
            // --------------------------------------------------

            if (availableClasses.isNotEmpty) ...[
              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,

                child: OutlinedButton.icon(
                  onPressed: () {
                    _showClassChangeDialog(
                      context,
                      availableClasses,
                    );
                  },

                  icon: const Icon(
                    Icons.auto_awesome,
                  ),

                  label: const Text(
                    'NEW CLASS AVAILABLE',
                  ),

                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.amberAccent,

                    side: BorderSide(
                      color: Colors.amberAccent.withOpacity(0.7),
                    ),

                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],

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

            const Spacer(),

            // --------------------------------------------------
            // RESET PLAYER
            // --------------------------------------------------

            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(
                onPressed: () {
                  _showResetPlayerDialog(context);
                },

                icon: const Icon(
                  Icons.restart_alt,
                ),

                label: const Text(
                  'RESET PLAYER',
                ),

                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.redAccent,

                  side: BorderSide(
                    color: Colors.redAccent.withOpacity(0.7),
                  ),

                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------
  // CLASS CHANGE DIALOG
  // --------------------------------------------------

  void _showClassChangeDialog(
    BuildContext context,
    List<PlayerClass> availableClasses,
  ) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text(
            'CLASS CHANGE AVAILABLE',
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              const Text(
                'Your training has unlocked new class options.',
              ),

              const SizedBox(height: 20),

              ...availableClasses.map(
                (playerClass) {
                  return ListTile(
                    leading: const Icon(
                      Icons.shield,
                    ),

                    title: Text(
                      playerClass.name.toUpperCase(),
                    ),

                    onTap: () async {
                      Navigator.of(context).pop();

                      await playerManager.changeClass(
                        playerClass,
                      );

                      if (!mounted) {
                        return;
                      }

                      setState(() {});
                    },
                  );
                },
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },

              child: const Text(
                'LATER',
              ),
            ),
          ],
        );
      },
    );
  }

  // --------------------------------------------------
  // RESET PLAYER DIALOG
  // --------------------------------------------------

  void _showResetPlayerDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,

      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'RESET PLAYER?',
          ),

          content: const Text(
            'Your level, class and attributes will be reset. '
            'Your unlocked training items will be preserved.',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },

              child: const Text(
                'CANCEL',
              ),
            ),

            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop();

                await playerManager.resetPlayer();

                if (!mounted) {
                  return;
                }

                setState(() {});

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'PLAYER RESET. YOUR TRAINING JOURNEY BEGINS AGAIN.',
                    ),
                  ),
                );
              },

              style: TextButton.styleFrom(
                foregroundColor: Colors.redAccent,
              ),

              child: const Text(
                'RESET',
              ),
            ),
          ],
        );
      },
    );
  }
}