class RegistrationData {
  static final RegistrationData _instance = RegistrationData._internal();

  factory RegistrationData() => _instance;

  RegistrationData._internal();

  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String menteeDisplayName = ''; // Display name for mentee
  String mentorDisplayName = ''; // Display name for mentor
  DateTime? dateOfBirth;
  String? yearLevel; // Year level for mentee
  String? course; // Course for mentee
  String? educationalBackground; // Educational background for mentor
  List<String> fieldsOfExpertise = []; // Fields of expertise
  String profileImage = ''; // Add this line
  String bio = ''; // Add this line

  void setData({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? menteeDisplayName,
    String? mentorDisplayName,
    String? yearLevel,
    String? course,
    String? educationalBackground,
    DateTime? dateOfBirth,
    List<String>? fieldsOfExpertise,
    String? profileImage,
    String? bio,
    
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.firstName = firstName ?? this.firstName;
    this.lastName = lastName ?? this.lastName;
    this.menteeDisplayName = menteeDisplayName ?? this.menteeDisplayName;
    this.mentorDisplayName = mentorDisplayName ?? this.mentorDisplayName;
    this.yearLevel = yearLevel ?? this.yearLevel;
    this.course = course ?? this.course;
    this.educationalBackground =
        educationalBackground ?? this.educationalBackground;
    this.dateOfBirth = dateOfBirth ?? this.dateOfBirth;
    this.fieldsOfExpertise = fieldsOfExpertise ?? this.fieldsOfExpertise;
    this.profileImage = profileImage ?? this.profileImage;
    this.bio = bio ?? this.bio; 
  }

  // Optionally, implement a clearData method to reset all fields
  // void clearData() {
  //   email = '';
  //   password = '';
  //   menteeDisplayName = '';
  //   mentorDisplayName = '';
  //   dateOfBirth = null;
  //   yearLevel = null;
  //   course = null;
  //   educationalBackground = null;
  //   fieldsOfExpertise = [];
  // }
}
