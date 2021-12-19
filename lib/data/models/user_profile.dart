import 'package:koperasi/data/db/user_profile_dao.dart';

class UserProfile{
  final String? id;
  final String name;
  final String gender;
  final String email;
  final String address;
  final String dateOfBirth;
  final String? maritalStatus;
  final String status;
  final String education;
  final String phone;
  final String religion;
  final String motherMaiden;
  final String fixedIncome;
  final String placeOfBirth;

  UserProfile(
      this.id,
      this.name,
      this.gender,
      this.email,
      this.address,
      this.dateOfBirth,
      this.maritalStatus,
      this.status,
      this.education,
      this.phone,
      this.religion,
      this.motherMaiden,
      this.fixedIncome,
      this.placeOfBirth);

  UserProfile.fromMap(Map<String, dynamic> map)
      : id = map[UserProfileDao.ID],
        name = map[UserProfileDao.NAME_FIELD],
        gender = map[UserProfileDao.GENDER],
        email = map[UserProfileDao.EMAIL_FIELD],
        address = map[UserProfileDao.ADDRESS],
        dateOfBirth = map[UserProfileDao.DATE_OF_BIRTH],
        maritalStatus = map[UserProfileDao.MARITAL_STATUS_FIELD],
        status = map[UserProfileDao.STATUS_FIELD],
        education = map[UserProfileDao.EDUCATION_FIELD],
        phone = map[UserProfileDao.PHONE_FIELD],
        religion = map[UserProfileDao.RELIGION],
        motherMaiden = map[UserProfileDao.MOTHER_MAIDEN],
        fixedIncome = map[UserProfileDao.FIXED_INCOME],
        placeOfBirth = map[UserProfileDao.PLACE_OF_BIRTH];

}