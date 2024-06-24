class Internship {
  final int id;
  final String title;
  final String employmentType;
  final String? jobTitle;
  final bool workFromHome;
  final String segment;
  final List<String> jobSegments;
  final String companyName;
  final String companyUrl;
  final bool isPremium;
  final bool isPremiumInternship;
  final String employerName;
  final String companyLogo;
  final String type;
  final String url;
  final int isInternChallenge;
  final bool isExternal;
  final bool isActive;
  final String expiresAt;
  final String closedAt;
  final String profileName;
  final bool partTime;
  final String startDate;
  final String duration;
  final Map<String, dynamic> stipend;
  final String? salary;
  final String? jobExperience;
  final String experience;
  final String postedOn;
  final int postedOnDateTime;
  final String applicationDeadline;
  final String expiringIn;
  final String postedByLabel;
  final String postedByLabelType;
  final List<String> locationNames;
  final List<Map<String, dynamic>> locations;
  final String startDateFormat;
  final String startDate1;
  final String startDate2;
  final bool isPPO;
  final bool isPPOSalaryDisclosed;
  final String? ppoSalary;
  final String? ppoSalary2;
  final String ppoLabelValue;
  final bool toShowExtraLabel;
  final String extraLabelValue;
  final bool isExtraLabelBlack;
  final List<String> campaignNames;
  final String campaignName;
  final bool toShowInSearch;
  final String campaignUrl;
  final String? campaignStartDateTime;
  final String? campaignLaunchDateTime;
  final String? campaignEarlyAccessStartDateTime;
  final String? campaignEndDateTime;
  final List<Map<String, dynamic>> labels;
  final String labelsApp;
  final List<String> labelsAppInCard;
  final bool isCovidWFHSelected;
  final bool toShowCardMessage;
  final String message;
  final bool isApplicationCappingEnabled;
  final String applicationCappingMessage;
  final bool eligibleForEasyApply;
  final bool eligibleForB2BApplyNow;
  final bool toShowB2BLabel;
  final bool isInternationalJob;
  final bool toShowCoverLetter;
  final String? officeDays;

  Internship({
    required this.id,
    required this.title,
    required this.employmentType,
    required this.jobTitle,
    required this.workFromHome,
    required this.segment,
    required this.jobSegments,
    required this.companyName,
    required this.companyUrl,
    required this.isPremium,
    required this.isPremiumInternship,
    required this.employerName,
    required this.companyLogo,
    required this.type,
    required this.url,
    required this.isInternChallenge,
    required this.isExternal,
    required this.isActive,
    required this.expiresAt,
    required this.closedAt,
    required this.profileName,
    required this.partTime,
    required this.startDate,
    required this.duration,
    required this.stipend,
    required this.salary,
    required this.jobExperience,
    required this.experience,
    required this.postedOn,
    required this.postedOnDateTime,
    required this.applicationDeadline,
    required this.expiringIn,
    required this.postedByLabel,
    required this.postedByLabelType,
    required this.locationNames,
    required this.locations,
    required this.startDateFormat,
    required this.startDate1,
    required this.startDate2,
    required this.isPPO,
    required this.isPPOSalaryDisclosed,
    required this.ppoSalary,
    required this.ppoSalary2,
    required this.ppoLabelValue,
    required this.toShowExtraLabel,
    required this.extraLabelValue,
    required this.isExtraLabelBlack,
    required this.campaignNames,
    required this.campaignName,
    required this.toShowInSearch,
    required this.campaignUrl,
    required this.campaignStartDateTime,
    required this.campaignLaunchDateTime,
    required this.campaignEarlyAccessStartDateTime,
    required this.campaignEndDateTime,
    required this.labels,
    required this.labelsApp,
    required this.labelsAppInCard,
    required this.isCovidWFHSelected,
    required this.toShowCardMessage,
    required this.message,
    required this.isApplicationCappingEnabled,
    required this.applicationCappingMessage,
    required this.eligibleForEasyApply,
    required this.eligibleForB2BApplyNow,
    required this.toShowB2BLabel,
    required this.isInternationalJob,
    required this.toShowCoverLetter,
    required this.officeDays,
  });

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
      id: json['id'],
      title: json['title'],
      employmentType: json['employment_type'],
      jobTitle: json['job_title'],
      workFromHome: json['work_from_home'] ?? false,
      segment: json['segment'] ?? '',
      jobSegments: List<String>.from(json['job_segments'] ?? []),
      companyName: json['company_name'],
      companyUrl: json['company_url'],
      isPremium: json['is_premium'] ?? false,
      isPremiumInternship: json['is_premium_internship'] ?? false,
      employerName: json['employer_name'],
      companyLogo: json['company_logo'],
      type: json['type'],
      url: json['url'],
      isInternChallenge: json['is_internchallenge'] ?? 0,
      isExternal: json['is_external'] ?? false,
      isActive: json['is_active'] ?? false,
      expiresAt: json['expires_at'],
      closedAt: json['closed_at'] ?? '',
      profileName: json['profile_name'],
      partTime: json['part_time'] ?? false,
      startDate: json['start_date'],
      duration: json['duration'],
      stipend: json['stipend'] ?? {},
      salary: json['salary'],
      jobExperience: json['job_experience'],
      experience: json['experience'] ?? '',
      postedOn: json['posted_on'],
      postedOnDateTime: json['postedOnDateTime'],
      applicationDeadline: json['application_deadline'],
      expiringIn: json['expiring_in'],
      postedByLabel: json['posted_by_label'],
      postedByLabelType: json['posted_by_label_type'],
      locationNames: List<String>.from(json['location_names'] ?? []),
      locations: List<Map<String, dynamic>>.from(json['locations'] ?? []),
      startDateFormat: json['start_date_comparison_format'],
      startDate1: json['start_date1'],
      startDate2: json['start_date2'],
      isPPO: json['is_ppo'] ?? false,
      isPPOSalaryDisclosed: json['is_ppo_salary_disclosed'] ?? false,
      ppoSalary: json['ppo_salary'],
      ppoSalary2: json['ppo_salary2'],
      ppoLabelValue: json['ppo_label_value'],
      toShowExtraLabel: json['to_show_extra_label'] ?? false,
      extraLabelValue: json['extra_label_value'] ?? '',
      isExtraLabelBlack: json['is_extra_label_black'] ?? false,
      campaignNames: List<String>.from(json['campaign_names'] ?? []),
      campaignName: json['campaign_name'] ?? '',
      toShowInSearch: json['to_show_in_search'] ?? false,
      campaignUrl: json['campaign_url'] ?? '',
      campaignStartDateTime: json['campaign_start_date_time'],
      campaignLaunchDateTime: json['campaign_launch_date_time'],
      campaignEarlyAccessStartDateTime: json['campaign_early_access_start_date_time'],
      campaignEndDateTime: json['campaign_end_date_time'],
      labels: List<Map<String, dynamic>>.from(json['labels'] ?? []),
      labelsApp: json['labels_app'] ?? '',
      labelsAppInCard: List<String>.from(json['labels_app_in_card'] ?? []),
      isCovidWFHSelected: json['is_covid_wfh_selected'] ?? false,
      toShowCardMessage: json['to_show_card_message'] ?? false,
      message: json['message'] ?? '',
      isApplicationCappingEnabled: json['is_application_capping_enabled'] ?? false,
      applicationCappingMessage: json['application_capping_message'] ?? '',
      eligibleForEasyApply: json['eligible_for_easy_apply'] ?? false,
      eligibleForB2BApplyNow: json['eligible_for_b2b_apply_now'] ?? false,
      toShowB2BLabel: json['to_show_b2b_label'] ?? false,
      isInternationalJob: json['is_international_job'] ?? false,
      toShowCoverLetter: json['to_show_cover_letter'] ?? false,
      officeDays: json['office_days'],
    );
  }
}
