class OnboardingDataEntity {
  final String fullName;
  final DateTime dateOfBirth;
  final String streetAddress;
  final String city;
  final String addressState;
  final String postalCode;
  final String country;

  const OnboardingDataEntity({
    required this.fullName,
    required this.dateOfBirth,
    required this.streetAddress,
    required this.city,
    required this.addressState,
    required this.postalCode,
    required this.country,
  });
}
