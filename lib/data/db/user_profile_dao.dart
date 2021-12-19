abstract class UserProfileDao {
  static const String TABLE_NAME = 'USER';
  static const String ID = 'id';
  static const String NAME_FIELD = 'name';
  static const String MARITAL_STATUS_FIELD = 'marital_status';
  static const String EDUCATION_FIELD = 'education';
  static const String STATUS_FIELD = 'status';
  static const String PHONE_FIELD = 'phone';
  static const String EMAIL_FIELD = 'email';
  static const String ADDRESS= 'address';

  static const String GENDER = 'gender';
  static const String PLACE_OF_BIRTH = 'place_of_birth';
  static const String DATE_OF_BIRTH= 'date_of_birth';
  static const String RELIGION = 'religion';
  static const String MOTHER_MAIDEN = 'mother_maiden';
  static const String FIXED_INCOME = 'fixed_income';

  static const String CREATE_TABLE = 'CREATE TABLE IF NOT EXISTS $TABLE_NAME '
      '($NAME_FIELD TEXT,'
      '$MARITAL_STATUS_FIELD TEXT,'
      '$ID TEXT,'
      '$EDUCATION_FIELD TEXT,'
      '$STATUS_FIELD TEXT,'
      '$PHONE_FIELD TEXT UNIQUE, '
      '$EMAIL_FIELD TEXT UNIQUE, '
      '$ADDRESS TEXT,'
      '$GENDER TEXT,'
      '$PLACE_OF_BIRTH TEXT,'
      '$DATE_OF_BIRTH TEXT,'
      '$RELIGION TEXT,'
      '$MOTHER_MAIDEN TEXT,'
      '$FIXED_INCOME TEXT)';
}
