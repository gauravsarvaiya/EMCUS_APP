part of utils;

extension CustomTextStyle on TextStyle{

  static TextStyle get regularFont16Style=> TextStyle(
      color: kTextFiledTextColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400
  );

  static TextStyle get textFieldRegularFont16Style => TextStyle(
      color: kBlackColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400
  );

  static TextStyle get boldFont22Style=> TextStyle(
      color: kWhiteColor,
      fontSize: 22.sp,
      fontWeight: FontWeight.w700
  );

  static TextStyle get boldFont24Style=> TextStyle(
      color: kWhiteColor,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700
  );

  static TextStyle get boldFont26Style=> TextStyle(
      color: kWhiteColor,
      fontSize: 26.sp,
      fontWeight: FontWeight.w700
  );
}