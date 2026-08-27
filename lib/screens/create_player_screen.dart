import 'package:flutter/material.dart';

import '../database/app_database.dart';

import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';
import '../managers/class_manager.dart';

import 'main_screen.dart';

class CreatePlayerScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;
  final ClassManager classManager;
  final AppDatabase database;

  const CreatePlayerScreen({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.classManager,
    required this.database,
  });

  @override
  State<CreatePlayerScreen> createState() =>
      _CreatePlayerScreenState();
}

class _CreatePlayerScreenState
    extends State<CreatePlayerScreen> {
  final TextEditingController _nameController =
      TextEditingController();

  bool isCreating = false;

  // --------------------------------------------------
  // GET MANAGERS
  // --------------------------------------------------

  PlayerManager get playerManager =>
      widget.playerManager;

  TrainingPlanManager get trainingPlanManager =>
      widget.trainingPlanManager;

  ClassManager get classManager =>
      widget.classManager;

  AppDatabase get database =>
      widget.database;

  // --------------------------------------------------
  // DISPOSE
  // --------------------------------------------------

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // --------------------------------------------------
  // CREATE PLAYER
  // --------------------------------------------------

  Future<void> createPlayer() async {
    final name = _nameController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'ENTER A PLAYER NAME',
          ),
        ),
      );

      return;
    }

    setState(() {
      isCreating = true;
    });

    await playerManager.createPlayer(
      name: name,
    );

    if (!mounted) {
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => MainScreen(
          playerManager: playerManager,
          trainingPlanManager: trainingPlanManager,
          classManager: classManager,
          database: database,
        ),
      ),
    );
  }

  // --------------------------------------------------
  // BUILD
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CREATE PLAYER'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch,

            children: [
              // --------------------------------------------------
              // TITLE
              // --------------------------------------------------

              const SizedBox(height: 30),

              const Text(
                'CREATE YOUR CHARACTER',
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'BEGIN YOUR TRAINING JOURNEY',
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 2,
                  color: Colors.white54,
                ),
              ),

              const SizedBox(height: 45),

              // --------------------------------------------------
              // NAME
              // --------------------------------------------------

              TextField(
                controller: _nameController,

                enabled: !isCreating,

                textCapitalization:
                    TextCapitalization.words,

                decoration: InputDecoration(
                  labelText: 'PLAYER NAME',
                  hintText: 'Enter your name',

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),

                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                ),
              ),

              const Spacer(),

              // --------------------------------------------------
              // CREATE
              // --------------------------------------------------

              SizedBox(
                height: 55,

                child: ElevatedButton.icon(
                  onPressed:
                      isCreating ? null : createPlayer,

                  icon: isCreating
                      ? const SizedBox(
                          width: 20,
                          height: 20,

                          child:
                              CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(
                          Icons.flash_on,
                        ),

                  label: Text(
                    isCreating
                        ? 'CREATING...'
                        : 'CREATE PLAYER',

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),

                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blueAccent,

                    foregroundColor:
                        Colors.white,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}