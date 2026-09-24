class AvatarDefinition {
  final String id;
  final String name;

  const AvatarDefinition({
    required this.id,
    required this.name,
  });
}

// --------------------------------------------------
// AVAILABLE AVATARS
// --------------------------------------------------

const List<AvatarDefinition> availableAvatars = [
  AvatarDefinition(
    id: 'male_01',
    name: 'Male 01',
  ),
  AvatarDefinition(
    id: 'male_02',
    name: 'Male 02',
  ),
  AvatarDefinition(
    id: 'female_01',
    name: 'Female 01',
  ),
  AvatarDefinition(
    id: 'female_02',
    name: 'Female 02',
  ),
];