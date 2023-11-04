abstract class ProfileEvent {}

class ChangeAvatarRequest extends ProfileEvent{}

class OpenImagePicker extends ProfileEvent {}

class ProvideImagePath extends ProfileEvent {
  final String avatarPath;

  ProvideImagePath({required this.avatarPath});
}

class ProfileDescriptionChange extends ProfileEvent{
  final String description;

  ProfileDescriptionChange({required this.description});
}

class SaveProfileChanges extends ProfileEvent {}