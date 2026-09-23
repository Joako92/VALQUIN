import 'package:flutter/material.dart';

import '../config/equipment_visual_config.dart';

import '../models/equipment_slot.dart';

import '../renderers/avatar_renderer.dart';
import '../renderers/equipment_renderer.dart';

class PlayerEquipmentView extends StatefulWidget {
  final List<dynamic> equipment;
  final String avatarId;

  const PlayerEquipmentView({
    super.key,
    required this.equipment,
    required this.avatarId,
  });

  @override
  State<PlayerEquipmentView> createState() =>
      _PlayerEquipmentViewState();
}

class _PlayerEquipmentViewState extends State<PlayerEquipmentView> {
  // --------------------------------------------------
  // AVATAR
  // --------------------------------------------------

  int _avatarViewIndex = 0;

  EquipmentView get _equipmentView {
    switch (_avatarViewIndex) {
      case 0:
        return EquipmentView.front;

      case 1:
        return EquipmentView.threeQuarter;

      case 2:
        return EquipmentView.side;

      case 3:
        return EquipmentView.back;

      default:
        return EquipmentView.front;
    }
  }

  void _rotateAvatarRight() {
    if (_avatarViewIndex < 3) {
      setState(() {
        _avatarViewIndex++;
      });
    }
  }

  void _rotateAvatarLeft() {
    if (_avatarViewIndex > 0) {
      setState(() {
        _avatarViewIndex--;
      });
    }
  }

  // --------------------------------------------------
  // SHIELD AND WINGS LAYERING
  // --------------------------------------------------

  bool _shouldRenderShieldBehind() {
    return _avatarViewIndex >= 2;
  }

  bool _shouldRenderWingsBehind() {
    return _avatarViewIndex < 3;
  }

  // --------------------------------------------------
  // BUILD
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final equippedBySlot = {
      for (final item in widget.equipment)
        item.slot: item,
    };

    final head = equippedBySlot[EquipmentSlot.head];
    final shoulders =
        equippedBySlot[EquipmentSlot.shoulders];
    final chest = equippedBySlot[EquipmentSlot.chest];
    final belt = equippedBySlot[EquipmentSlot.belt];
    final legs = equippedBySlot[EquipmentSlot.legs];
    final weapon = equippedBySlot[EquipmentSlot.weapon];
    final shield = equippedBySlot[EquipmentSlot.shield];
    final wings = equippedBySlot[EquipmentSlot.wings];

    final hasHelmet = head != null;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // --------------------------------------------------
        // COLUMN
        // --------------------------------------------------

        Transform.translate(
          offset: const Offset(0, 320),
          child: Transform.scale(
            scaleX: 1.2,
            scaleY: 0.7,
            child: Image.asset(
              'assets/images/valquin_column.png',
              fit: BoxFit.contain,
            ),
          ),
        ),

        // --------------------------------------------------
        // AVATAR + EQUIPMENT
        // --------------------------------------------------

        GestureDetector(
          onHorizontalDragEnd: (details) {
            final velocity =
                details.primaryVelocity ?? 0;

            if (velocity < 0) {
              _rotateAvatarRight();
            } else if (velocity > 0) {
              _rotateAvatarLeft();
            }
          },
          child: Transform.translate(
            offset: const Offset(0, 30),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // --------------------------------------------------
                // SHIELD - BEHIND
                // --------------------------------------------------

                if (shield != null &&
                    _shouldRenderShieldBehind())
                  EquipmentRenderer(
                    item: shield,
                    view: _equipmentView,
                  ),

                // --------------------------------------------------
                // BASE AVATAR
                // --------------------------------------------------

                AvatarRenderer(
                  avatarId: widget.avatarId,
                  viewIndex: _avatarViewIndex,
                  hasHelmet: hasHelmet,
                ),

                // --------------------------------------------------
                // WINGS - BEHIND
                // --------------------------------------------------

                if (wings != null &&
                    _shouldRenderWingsBehind())
                  EquipmentRenderer(
                    item: wings,
                    view: _equipmentView,
                  ),

                // --------------------------------------------------
                // LEGS
                // --------------------------------------------------

                if (legs != null)
                  EquipmentRenderer(
                    item: legs,
                    view: _equipmentView,
                  ),

                // --------------------------------------------------
                // BELT
                // --------------------------------------------------

                if (belt != null)
                  EquipmentRenderer(
                    item: belt,
                    view: _equipmentView,
                  ),

                // --------------------------------------------------
                // CHEST
                // --------------------------------------------------

                if (chest != null)
                  EquipmentRenderer(
                    item: chest,
                    view: _equipmentView,
                  ),

                // --------------------------------------------------
                // HEAD
                // --------------------------------------------------

                if (head != null)
                  EquipmentRenderer(
                    item: head,
                    view: _equipmentView,
                  ),

                // --------------------------------------------------
                // WEAPON
                // --------------------------------------------------

                if (weapon != null)
                  EquipmentRenderer(
                    item: weapon,
                    view: _equipmentView,
                  ),

                // --------------------------------------------------
                // WINGS - FRONT
                // --------------------------------------------------

                if (wings != null &&
                    !_shouldRenderWingsBehind())
                  EquipmentRenderer(
                    item: wings,
                    view: _equipmentView,
                  ),

                // --------------------------------------------------
                // SHOULDERS
                // --------------------------------------------------

                if (shoulders != null)
                  EquipmentRenderer(
                    item: shoulders,
                    view: _equipmentView,
                  ),

                // --------------------------------------------------
                // SHIELD - FRONT
                // --------------------------------------------------

                if (shield != null &&
                    !_shouldRenderShieldBehind())
                  EquipmentRenderer(
                    item: shield,
                    view: _equipmentView,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
