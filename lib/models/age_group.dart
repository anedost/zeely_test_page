enum AgeGroup {
  youngAdults(18, 24),
  adults(25, 39),
  middleAged(40, 54),
  olderAdults(55, null);

  final int minAge;
  final int? maxAge;
  const AgeGroup(this.minAge, this.maxAge);

  String get ageRange => maxAge != null ? '$minAge - $maxAge' : '$minAge+';

  static AgeGroup fromAge(int age) {
    return AgeGroup.values.lastWhere((g) => age >= g.minAge, orElse: () => AgeGroup.youngAdults);
  }
}
