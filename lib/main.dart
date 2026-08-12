import 'package:flutter/material.dart';

void main() {
  runApp(const SoloTrainingApp());
}

class SoloTrainingApp extends StatelessWidget {
  const SoloTrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF080B12),
      ),
      home: const MainScreen(),
    );
  }
}

// ============================================================
// MAIN SCREEN
// ============================================================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    PlayerScreen(),
    InventoryScreen(),
    EquipScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF0D111A),
        indicatorColor: Colors.blueAccent.withOpacity(0.2),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'STATUS',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'INVENTORY',
          ),
          NavigationDestination(
            icon: Icon(Icons.shield_outlined),
            selectedIcon: Icon(Icons.shield),
            label: 'EQUIP',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// STATUS
// ============================================================

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

                  const Text(
                    'JOAQUIN',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'NOVICE',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'LEVEL 1',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const LinearProgressIndicator(
                      value: 0.7,
                      minHeight: 12,
                      backgroundColor: Colors.white12,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.blueAccent,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    '70 / 100 XP',
                    style: TextStyle(
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

            const Row(
              children: [
                Expanded(
                  child: AttributeCard(
                    name: 'STRENGTH',
                    value: 10,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: AttributeCard(
                    name: 'ENDURANCE',
                    value: 10,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            const Row(
              children: [
                Expanded(
                  child: AttributeCard(
                    name: 'ENERGY',
                    value: 10,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: AttributeCard(
                    name: 'STAMINA',
                    value: 10,
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

// ============================================================
// ATTRIBUTE CARD
// ============================================================

class AttributeCard extends StatelessWidget {
  final String name;
  final int value;

  const AttributeCard({
    super.key,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Column(
        children: [
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white54,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            '$value',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// INVENTORY
// ============================================================

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INVENTORY'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),

      body: Column(
        children: [
          // --------------------------------------------------
          // FILTERS
          // --------------------------------------------------

          SizedBox(
            height: 55,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                InventoryFilter(
                  label: 'ALL',
                  selected: true,
                ),
                InventoryFilter(
                  label: 'HEAD',
                ),
                InventoryFilter(
                  label: 'CHEST',
                ),
                InventoryFilter(
                  label: 'SHOULDERS',
                ),
                InventoryFilter(
                  label: 'ARMS',
                ),
                InventoryFilter(
                  label: 'LEGS',
                ),
                InventoryFilter(
                  label: 'WINGS',
                ),
              ],
            ),
          ),

          // --------------------------------------------------
          // ITEMS
          // --------------------------------------------------

          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(
                20,
                10,
                20,
                20,
              ),
              children: const [
                ExerciseItem(
                  name: 'PECHERA DEL COLOSO',
                  exercise: 'Press de banca',
                  slot: 'CHEST',
                  rarity: 'RARE',
                ),

                ExerciseItem(
                  name: 'ALAS DEL CAZADOR',
                  exercise: 'Dominadas',
                  slot: 'WINGS',
                  rarity: 'EPIC',
                ),

                ExerciseItem(
                  name: 'GREBAS DEL TITÁN',
                  exercise: 'Sentadilla',
                  slot: 'LEGS',
                  rarity: 'RARE',
                ),

                ExerciseItem(
                  name: 'BRAZALES DEL BERSERKER',
                  exercise: 'Curl de bíceps',
                  slot: 'ARMS',
                  rarity: 'COMMON',
                ),

                ExerciseItem(
                  name: 'MANTO DEL GUARDIÁN',
                  exercise: 'Press militar',
                  slot: 'SHOULDERS',
                  rarity: 'EPIC',
                ),

                ExerciseItem(
                  name: 'CORONA DEL CORREDOR',
                  exercise: 'Running',
                  slot: 'HEAD',
                  rarity: 'COMMON',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// INVENTORY FILTER
// ============================================================

class InventoryFilter extends StatelessWidget {
  final String label;
  final bool selected;

  const InventoryFilter({
    super.key,
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) {},
        backgroundColor: const Color(0xFF111827),
        selectedColor: Colors.blueAccent.withOpacity(0.25),
        side: BorderSide(
          color: selected
              ? Colors.blueAccent
              : Colors.white12,
        ),
        labelStyle: TextStyle(
          fontSize: 11,
          letterSpacing: 1,
          color: selected
              ? Colors.blueAccent
              : Colors.white54,
        ),
      ),
    );
  }
}

// ============================================================
// EXERCISE ITEM
// ============================================================

class ExerciseItem extends StatelessWidget {
  final String name;
  final String exercise;
  final String slot;
  final String rarity;

  const ExerciseItem({
    super.key,
    required this.name,
    required this.exercise,
    required this.slot,
    required this.rarity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white12,
              ),
            ),
            child: const Icon(
              Icons.shield_outlined,
              size: 30,
              color: Colors.blueAccent,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  exercise,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    Text(
                      slot,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white38,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Text(
                      rarity,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// EQUIP
// ============================================================

class EquipScreen extends StatelessWidget {
  const EquipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EQUIP'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          20,
          10,
          20,
          20,
        ),
        child: Column(
          children: [
            const Text(
              'TRAINING PLAN',
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 4,
                color: Colors.white54,
              ),
            ),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF0D111A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.blueAccent.withOpacity(0.25),
                ),
              ),
              child: Column(
                children: [
                  // HEAD
                  const EquipmentSlot(
                    label: 'HEAD',
                    icon: Icons.air,
                  ),

                  const SizedBox(height: 15),

                  // WINGS
                  const EquipmentSlot(
                    label: 'WINGS',
                    icon: Icons.flutter_dash,
                    width: 150,
                    height: 75,
                  ),

                  const SizedBox(height: 15),

                  // SHOULDERS
                  const EquipmentSlot(
                    label: 'SHOULDERS',
                    icon: Icons.accessibility_new,
                    width: 150,
                    height: 75,
                  ),

                  const SizedBox(height: 15),

                  // CHEST
                  const EquipmentSlot(
                    label: 'CHEST',
                    icon: Icons.shield,
                    width: 150,
                    height: 85,
                  ),

                  const SizedBox(height: 15),

                  // ARMS
                  const EquipmentSlot(
                    label: 'ARMS',
                    icon: Icons.fitness_center,
                    width: 150,
                    height: 75,
                  ),

                  const SizedBox(height: 15),

                  // LEGS
                  const EquipmentSlot(
                    label: 'LEGS',
                    icon: Icons.directions_run,
                    width: 150,
                    height: 85,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // EXECUTE
            // ------------------------------------------------

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.flash_on,
                  size: 26,
                ),
                label: const Text(
                  'EXECUTE',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// EQUIPMENT SLOT
// ============================================================

class EquipmentSlot extends StatelessWidget {
  final String label;
  final IconData icon;
  final double width;
  final double height;

  const EquipmentSlot({
    super.key,
    required this.label,
    required this.icon,
    this.width = 100,
    this.height = 70,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: Colors.white24,
          ),

          const SizedBox(height: 5),

          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white30,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}