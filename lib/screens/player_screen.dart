import 'package:flutter/material.dart';

import '../managers/player_manager.dart';
import '../managers/class_manager.dart';
import '../models/player.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              // --------------------------------------------------
              // PLAYER
              // --------------------------------------------------

              Expanded(
                child: Container(
                  width: double.infinity,

                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFF111827),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Column(
                    children: [
                      // --------------------------------------------------
                      // PLAYER IDENTITY
                      // --------------------------------------------------

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        crossAxisAlignment:
                            CrossAxisAlignment.center,

                        children: [
                          Text(
                            player.name,

                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),

                          const SizedBox(width: 8),

                          IconButton(
                            onPressed: () {
                              _showResetPlayerDialog(
                                context,
                              );
                            },

                            icon: const Icon(
                              Icons.restart_alt,
                              size: 20,
                            ),

                            tooltip: 'Reset Player',

                            visualDensity:
                                VisualDensity.compact,

                            padding: EdgeInsets.zero,

                            constraints:
                                const BoxConstraints(),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        children: [
                          Text(
                            player.playerClass.name
                                .toUpperCase(),

                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),

                          const SizedBox(width: 12),

                          Text(
                            'LV ${player.level}',

                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------
                      // XP
                      // --------------------------------------------------

                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(10),

                        child: LinearProgressIndicator(
                          value:
                              player.xpForCurrentLevel /
                                  player.xpRequiredForLevel,

                          minHeight: 10,

                          backgroundColor:
                              Colors.white12,

                          valueColor:
                              const AlwaysStoppedAnimation<Color>(
                            Colors.blueAccent,
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        '${player.xpForCurrentLevel}/${player.xpRequiredForLevel} XP',

                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // --------------------------------------------------
                      // ATTRIBUTES
                      // --------------------------------------------------

                      Row(
                        children: [
                          Expanded(
                            child: _buildAttribute(
                              'STRENGTH',
                              player.stats.strength,
                            ),
                          ),

                          const SizedBox(width: 20),

                          Expanded(
                            child: _buildAttribute(
                              'ENDURANCE',
                              player.stats.endurance,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          Expanded(
                            child: _buildAttribute(
                              'ENERGY',
                              player.stats.energy,
                            ),
                          ),

                          const SizedBox(width: 20),

                          Expanded(
                            child: _buildAttribute(
                              'STAMINA',
                              player.stats.stamina,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // --------------------------------------------------
                      // AVATAR PLACEHOLDER
                      // --------------------------------------------------

                      Expanded(
                        child: Container(
                          width: double.infinity,

                          decoration: BoxDecoration(
                            color: Colors.white.withValues(
                              alpha: 0.03,
                            ),

                            borderRadius:
                                BorderRadius.circular(16),
                          ),

                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(16),

                            child: Image.asset(
                              'assets/images/Avatar-01.png',

                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      foregroundColor:
                          Colors.amberAccent,

                      side: BorderSide(
                        color: Colors.amberAccent
                            .withValues(alpha: 0.7),
                      ),

                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 16,
                      ),

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // ATTRIBUTE
  // --------------------------------------------------

  Widget _buildAttribute(
    String name,
    int value,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,

            style: const TextStyle(
              fontSize: 11,
              color: Colors.white54,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),

        Text(
          value.toString(),

          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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

                if (!context.mounted) {
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
