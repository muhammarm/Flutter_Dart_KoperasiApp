class Saving{
  final int sourceFund;
  final int fixedIncome;
  final int variableIncome;
  final int depositAmount;
  final int? tenor;
  final int? interestMethod;
  final String benefName;
  final String benefPhone;
  final int benefPob;
  final String benefDob;
  final String benefStreet;

  Saving(
      this.sourceFund,
      this.fixedIncome,
      this.variableIncome,
      this.depositAmount,
      this.tenor,
      this.interestMethod,
      this.benefName,
      this.benefPhone,
      this.benefPob,
      this.benefDob,
      this.benefStreet);

  Map<String, dynamic> toMap() => {
    'sourceFund': sourceFund,
    'fixedIncome': fixedIncome,
    'variableIncome' : variableIncome,
    'depositAmount' : depositAmount,
    'tenor' : tenor,
    'interestMethod' : interestMethod,
    'benefName' : benefName,
    'benefPhone' : benefPhone,
    'benefPob' : benefPob,
    'benefDob' : benefDob,
    'benefStreet' : benefStreet
  };
}