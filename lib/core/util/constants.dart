// Supported languages
import 'package:smart_select/smart_select.dart';

const LANGUAGE_ARABIC = 'ar';
const LANGUAGE_ENGLISH = 'en';
const LANGUAGE_DEFAULT = LANGUAGE_ARABIC;

class PreferencesKeys {
  static const USER_ID = 'user_id';
  static const USER_TOKEN = 'user_token';
  static const FORGET_PASSWORD_USER_TOKEN = 'forget_user_token';
  static const USER_PRIVATE_TOKEN = 'user_private_token';
  static const USERNAME = 'user_name';
  static const USER_EMAIL = 'user_email';
  static const BIRTH_DATE = 'birth_date';
  static const USER_GENDER = 'user_gender';
  static const USER_PICTURE = 'user_picture';
  static const APP_LANGUAGE = 'app_language';
  static const IS_LOGGED_IN = 'is_logged_in';
  static const USER_FIRST_NAME = 'first_name';
  static const USER_LAST_NAME = 'last_name';
  static const USER_FULL_NAME = 'full_name';
  static const USER_PHONE = 'phone';

  static const SERVER_CONFIG = 'server_config';
  static const SITE_INFO = 'site_info';
}

// Errors
const UNKNOWN_ERROR = 0;
const NETWORK_ERROR = 1;
const SERVER_ERROR = 2;

// Response codes
const STATUS_OK = 200;
const BAD_REQUEST = 400;
const NOT_FOUND = 404;
const SERVER_EXCEPTION = 500;

const DEFAULT_USER_IMAGE =
    'https://www.techpowerusa.com/wp-content/uploads/2017/06/default-user.png';

// SVG Strings images
const POINT_SVG =
    '<svg viewBox="25.5 4.5 1181.7 739.3" ><path transform="matrix(-0.994522, 0.104528, -0.104528, -0.994522, 1210.22, 629.05)" d="M 514.8587036132813 4.682301998138428 C 770.7109985351563 34.44736480712891 819.449462890625 63.1270751953125 785.9893798828125 141.2199554443359 C 752.5293579101563 219.31298828125 596.099365234375 222.2564086914063 785.3538208007813 318.4239501953125 C 974.6080932617188 414.5916137695313 1391.435791015625 495.7384033203125 879.1799926757813 589.7847900390625 C 366.9242858886719 683.8313598632813 2.271200180053711 593.0403442382813 2.779731750488281 451.2772521972656 C 3.239944458007813 322.9827270507813 212.7193603515625 36.75537109375 442.9670104980469 5.478462696075439 C 466.2438354492188 2.315340518951416 490.5506591796875 1.854381084442139 514.8587036132813 4.682301998138428 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

// for general used -----------------------------

///
///[provinces] :
///this constent list represent the list of provincens name in syria
///
List<S2Choice<String>> governorates = [
  S2Choice<String>(value: GovernoratesValueName.damascus, title: 'دمشق'),
  S2Choice<String>(
      value: GovernoratesValueName.damascusCountryside, title: 'ريف دمشق'),
  S2Choice<String>(value: GovernoratesValueName.aleppo, title: 'حلب'),
  S2Choice<String>(value: GovernoratesValueName.homs, title: 'حمص'),
  S2Choice<String>(value: GovernoratesValueName.latakia, title: 'الاذقية'),
  S2Choice<String>(value: GovernoratesValueName.tartous, title: 'طرطوس'),
  S2Choice<String>(value: GovernoratesValueName.baniyas, title: 'بانياس'),
  S2Choice<String>(value: GovernoratesValueName.hama, title: 'حماة'),
  S2Choice<String>(value: GovernoratesValueName.daraa, title: 'درعا'),
  S2Choice<String>(value: GovernoratesValueName.suwayda, title: 'السويداء'),
  S2Choice<String>(value: GovernoratesValueName.deralzoor, title: 'دير الزور'),
  S2Choice<String>(value: GovernoratesValueName.raqqa, title: 'الرقة'),
  S2Choice<String>(value: GovernoratesValueName.hasakah, title: 'الحسكة'),
  S2Choice<String>(value: GovernoratesValueName.kenitra, title: 'القنيطرة'),
];

class GovernoratesValueName {
  static String damascus = 'Dams';

  static String damascusCountryside = 'DamC';

  static String aleppo = 'Alep';

  static String homs = 'Homs';

  static String hama = 'Hama';

  static String latakia = 'Lata';

  static String tartous = 'Tart';

  static String baniyas = 'Bani';

  static String suwayda = 'Suwa';

  static String kenitra = 'Keni';

  static String daraa = 'Dara';

  static String raqqa = 'Raqq';

  static String hasakah = 'Hasa';

  static String deralzoor = 'Derz';
}

List<S2Choice<String>> nationality = [
  S2Choice<String>(value: NationalityValue.syrian, title: 'سوري'),
  S2Choice<String>(value: NationalityValue.palestinian, title: 'فلسطيني'),
  S2Choice<String>(value: NationalityValue.other, title: 'غير ذلك'),
];

class NationalityValue {
  static String syrian = 'syrian';

  static String palestinian = 'palestinian';

  static String other = 'other';
}

List<S2Choice<String>> genderList = [
  S2Choice<String>(value: GenderValue.male, title: 'ذكر'),
  S2Choice<String>(value: GenderValue.female, title: 'انثى')
];

class GenderValue {
  static String male = 'male';

  static String female = 'female';
}

const List<String> universityName = [
  'جامعة دمشق',
  'جامعة تشرين',
  'جامعة حلب',
  'جامعة البعث',
  'معهد العالي للعلوم',
  'جامعة القلمون',
  'جامعة الرشيد',
  'جامعة SPU',
  'جامعة APU',
];

List<S2Choice<String>> currentLevelDegree = [
  S2Choice<String>(value: CurrentLevelDegreeValue.graduate, title: 'متخرج'),
  S2Choice<String>(
      value: CurrentLevelDegreeValue.collegeStudent, title: 'طالب جامعي'),
  S2Choice<String>(
      value: CurrentLevelDegreeValue.beforeCollageStudy,
      title: 'مرحلة ما قبل الجامعة'),
];

class CurrentLevelDegreeValue {
  static String graduate = 'graduate';
  static String collegeStudent = 'collegeStudent';
  static String beforeCollageStudy = 'beforeCollageStudy';
}

List<S2Choice<String>> teacherServicess = [
  S2Choice<String>(
      value: TeacherServicessValue.teachArbFirstClass,
      title: 'تدريس عربي مرحلة أبتدائي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachArbSecoundClass,
      title: 'تدريس عربي مرحلة إعدادي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachArbFinalClass,
      title: 'تدريس عربي مرحلة ثانوي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachEngFirstClass,
      title: 'تدريس انكليزي مرحلة أبتدائي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachEngSecoundClass,
      title: 'تدريس انكليزي مرحلة إعدادي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachEngFinalClass,
      title: 'تدريس انكليزي مرحلة ثانوي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachMathFirstClass,
      title: 'تدريس رياضيات مرحلة أبتدائي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachMathSecoundClass,
      title: 'تدريس رياضيات مرحلة إعدادي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachMathFinalClass,
      title: 'تدريس رياضيات مرحلة ثانوي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachSinceFirstClass,
      title: 'تدريس علوم مرحلة أبتدائي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachSinceSecoundClass,
      title: 'تدريس علوم مرحلة إعدادي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachSinceFinalClass,
      title: 'تدريس علوم مرحلة ثانوي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachPhysicsFirstClass,
      title: 'تدريس فيزياء مرحلة أبتدائي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachPhysicsSecoundClass,
      title: 'تدريس فيزياء مرحلة إعدادي'),
  S2Choice<String>(
      value: TeacherServicessValue.teachPhysicsFinalClass,
      title: 'تدريس فيزياء مرحلة ثانوي'),
];

class TeacherServicessValue {
  static String teachMathFirstClass = 'teachMathFirstClass';
  static String teachMathSecoundClass = 'teachMathSecoundClass';
  static String teachMathFinalClass = 'teachMathFinalClass';
  static String teachSinceFirstClass = 'teachSinceFirstClass';
  static String teachSinceSecoundClass = 'teachSinceSecoundClass';
  static String teachSinceFinalClass = 'teachSinceFinalClass';
  static String teachPhysicsFirstClass = 'teachPhysicsFirstClass';
  static String teachPhysicsSecoundClass = 'teachPhysicsSecoundClass';
  static String teachPhysicsFinalClass = 'teachPhysicsFinalClass';
  static String teachEngFirstClass = 'teachEngFirstClass';
  static String teachEngSecoundClass = 'teachEngSecoundClass';
  static String teachEngFinalClass = 'teachEngFinalClass';
  static String teachArbFirstClass = 'teachArbFirstClass';
  static String teachArbSecoundClass = 'teachArbSecoundClass';
  static String teachArbFinalClass = 'teachArbFinalClass';
}

List<S2Choice<String>> universitySpecificList = [
  S2Choice<String>(value: UniversitySpecificValue.math, title: 'رياضيات'),
  S2Choice<String>(value: UniversitySpecificValue.sciences, title: 'علوم'),
  S2Choice<String>(value: UniversitySpecificValue.chemistry, title: 'كمياء'),
  S2Choice<String>(value: UniversitySpecificValue.phisces, title: 'فيزياء'),
  S2Choice<String>(
      value: UniversitySpecificValue.generalSciences, title: 'علوم عامة'),
  S2Choice<String>(value: UniversitySpecificValue.arabic, title: 'أدب عربي'),
  S2Choice<String>(
      value: UniversitySpecificValue.english, title: 'أدب أنكليزي'),
  S2Choice<String>(value: UniversitySpecificValue.french, title: 'أدب فرنسي'),
  S2Choice<String>(value: UniversitySpecificValue.hestory, title: 'تاريخ'),
  S2Choice<String>(value: UniversitySpecificValue.geography, title: 'جغرافيا'),
];

class UniversitySpecificValue {
  static String math = 'math';
  static String sciences = 'scien';
  static String chemistry = 'chemi';
  static String generalSciences = 'genScien';
  static String arabic = 'arab';
  static String english = 'eng';
  static String french = 'fren';
  static String hestory = 'hest';
  static String geography = 'geog';
  static String phisces = 'phis';
}

List<S2Choice<String>> currentUnversityYears = [
  S2Choice<String>(value: StudyCollegeYear.freshman, title: 'سنة أولى'),
  S2Choice<String>(value: StudyCollegeYear.sophomore, title: 'سنة ثانية'),
  S2Choice<String>(value: StudyCollegeYear.junior, title: 'سنة ثالثة'),
  S2Choice<String>(value: StudyCollegeYear.senior, title: 'سنة رابعة'),
];

class StudyCollegeYear {
  static String freshman = 'freshman';
  static String sophomore = 'sophomore';
  static String junior = 'junior';
  static String senior = 'Senior';
}
