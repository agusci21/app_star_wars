final class ReportCharacterInput {
  final int characterId;
  final DateTime reportedDate;
  final String characterName;

  ReportCharacterInput({
    required this.characterId,
    required this.reportedDate,
    required this.characterName,
  });

  Map<String, dynamic> toJson() => {
        "userId": characterId,
        "dateTime": reportedDate.toString(),
        "character_name": characterName,
      };
}
