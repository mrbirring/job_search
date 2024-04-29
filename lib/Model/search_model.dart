// To parse this JSON data, do
//
//     final  SearchGet =  SearchGetFromJson(jsonString);

import 'dart:convert';

SearchGet SearchGetFromJson(String str) =>
    SearchGet.fromJson(json.decode(str));

String SearchGetToJson(SearchGet data) => json.encode(data.toJson());

class SearchGet {
  String? status;
  String? requestId;
  Parameters? parameters;
  List<Datum>? data;

  SearchGet({
    this.status,
    this.requestId,
    this.parameters,
    this.data,
  });

  factory SearchGet.fromJson(Map<String, dynamic> json) => SearchGet(
        status: json["status"],
        requestId: json["request_id"],
        parameters: json["parameters"] == null
            ? null
            : Parameters.fromJson(json["parameters"]),
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request_id": requestId,
        "parameters": parameters?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? jobId;
  String? employerName;
  String? employerLogo;
  dynamic? employerWebsite;
  dynamic? employerCompanyType;
  String? jobPublisher;
  String? jobEmploymentType;
  String? jobTitle;
  String? jobApplyLink;
  bool? jobApplyIsDirect;
  double? jobApplyQualityScore;
  List<ApplyOption>? applyOptions;
  String? jobDescription;
  bool? jobIsRemote;
  int? jobPostedAtTimestamp;
  DateTime? jobPostedAtDatetimeUtc;
  String? jobCity;
  String? jobState;
  String? jobCountry;
  double? jobLatitude;
  double? jobLongitude;
  dynamic jobBenefits;
  String? jobGoogleLink;
  DateTime? jobOfferExpirationDatetimeUtc;
  int? jobOfferExpirationTimestamp;
  JobRequiredExperience? jobRequiredExperience;
  dynamic jobRequiredSkills;
  JobRequiredEducation? jobRequiredEducation;
  bool? jobExperienceInPlaceOfEducation;
  dynamic jobMinSalary;
  dynamic jobMaxSalary;
  dynamic jobSalaryCurrency;
  dynamic jobSalaryPeriod;
  JobHighlights? jobHighlights;
  dynamic jobJobTitle;
  String? jobPostingLanguage;
  String? jobOnetSoc;
  String? jobOnetJobZone;
  dynamic jobOccupationalCategories;
  dynamic jobNaicsCode;
  dynamic jobNaicsName;

  Datum({
    this.jobId,
    this.employerName,
    this.employerLogo,
    this.employerWebsite,
    this.employerCompanyType,
    this.jobPublisher,
    this.jobEmploymentType,
    this.jobTitle,
    this.jobApplyLink,
    this.jobApplyIsDirect,
    this.jobApplyQualityScore,
    this.applyOptions,
    this.jobDescription,
    this.jobIsRemote,
    this.jobPostedAtTimestamp,
    this.jobPostedAtDatetimeUtc,
    this.jobCity,
    this.jobState,
    this.jobCountry,
    this.jobLatitude,
    this.jobLongitude,
    this.jobBenefits,
    this.jobGoogleLink,
    this.jobOfferExpirationDatetimeUtc,
    this.jobOfferExpirationTimestamp,
    this.jobRequiredExperience,
    this.jobRequiredSkills,
    this.jobRequiredEducation,
    this.jobExperienceInPlaceOfEducation,
    this.jobMinSalary,
    this.jobMaxSalary,
    this.jobSalaryCurrency,
    this.jobSalaryPeriod,
    this.jobHighlights,
    this.jobJobTitle,
    this.jobPostingLanguage,
    this.jobOnetSoc,
    this.jobOnetJobZone,
    this.jobOccupationalCategories,
    this.jobNaicsCode,
    this.jobNaicsName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        jobId: json["job_id"],
        employerName: json["employer_name"],
        employerLogo: json["employer_logo"],
        employerWebsite: json["employer_website"],
        employerCompanyType: json["employer_company_type"],
        jobPublisher: json["job_publisher"],
        jobEmploymentType: json["job_employment_type"],
        jobTitle: json["job_title"],
        jobApplyLink: json["job_apply_link"],
        jobApplyIsDirect: json["job_apply_is_direct"],
        jobApplyQualityScore: json["job_apply_quality_score"]?.toDouble(),
        applyOptions: json["apply_options"] == null
            ? []
            : List<ApplyOption>.from(
                json["apply_options"]!.map((x) => ApplyOption.fromJson(x))),
        jobDescription: json["job_description"],
        jobIsRemote: json["job_is_remote"],
        jobPostedAtTimestamp: json["job_posted_at_timestamp"],
        jobPostedAtDatetimeUtc: json["job_posted_at_datetime_utc"] == null
            ? null
            : DateTime.parse(json["job_posted_at_datetime_utc"]),
        jobCity: json["job_city"],
        jobState: json["job_state"],
        jobCountry: json["job_country"],
        jobLatitude: json["job_latitude"]?.toDouble(),
        jobLongitude: json["job_longitude"]?.toDouble(),
        jobBenefits: json["job_benefits"],
        jobGoogleLink: json["job_google_link"],
        jobOfferExpirationDatetimeUtc:
            json["job_offer_expiration_datetime_utc"] == null
                ? null
                : DateTime.parse(json["job_offer_expiration_datetime_utc"]),
        jobOfferExpirationTimestamp: json["job_offer_expiration_timestamp"],
        jobRequiredExperience: json["job_required_experience"] == null
            ? null
            : JobRequiredExperience.fromJson(json["job_required_experience"]),
        jobRequiredSkills: json["job_required_skills"],
        jobRequiredEducation: json["job_required_education"] == null
            ? null
            : JobRequiredEducation.fromJson(json["job_required_education"]),
        jobExperienceInPlaceOfEducation:
            json["job_experience_in_place_of_education"],
        jobMinSalary: json["job_min_salary"],
        jobMaxSalary: json["job_max_salary"],
        jobSalaryCurrency: json["job_salary_currency"],
        jobSalaryPeriod: json["job_salary_period"],
        jobHighlights: json["job_highlights"] == null
            ? null
            : JobHighlights.fromJson(json["job_highlights"]),
        jobJobTitle: json["job_job_title"],
        jobPostingLanguage: json["job_posting_language"],
        jobOnetSoc: json["job_onet_soc"],
        jobOnetJobZone: json["job_onet_job_zone"],
        jobOccupationalCategories: json["job_occupational_categories"],
        jobNaicsCode: json["job_naics_code"],
        jobNaicsName: json["job_naics_name"],
      );

  Map<String, dynamic> toJson() => {
        "job_id": jobId,
        "employer_name": employerName,
        "employer_logo": employerLogo,
        "employer_website": employerWebsite,
        "employer_company_type": employerCompanyType,
        "job_publisher": jobPublisher,
        "job_employment_type": jobEmploymentType,
        "job_title": jobTitle,
        "job_apply_link": jobApplyLink,
        "job_apply_is_direct": jobApplyIsDirect,
        "job_apply_quality_score": jobApplyQualityScore,
        "apply_options": applyOptions == null
            ? []
            : List<dynamic>.from(applyOptions!.map((x) => x.toJson())),
        "job_description": jobDescription,
        "job_is_remote": jobIsRemote,
        "job_posted_at_timestamp": jobPostedAtTimestamp,
        "job_posted_at_datetime_utc": jobPostedAtDatetimeUtc?.toIso8601String(),
        "job_city": jobCity,
        "job_state": jobState,
        "job_country": jobCountry,
        "job_latitude": jobLatitude,
        "job_longitude": jobLongitude,
        "job_benefits": jobBenefits,
        "job_google_link": jobGoogleLink,
        "job_offer_expiration_datetime_utc":
            jobOfferExpirationDatetimeUtc?.toIso8601String(),
        "job_offer_expiration_timestamp": jobOfferExpirationTimestamp,
        "job_required_experience": jobRequiredExperience?.toJson(),
        "job_required_skills": jobRequiredSkills,
        "job_required_education": jobRequiredEducation?.toJson(),
        "job_experience_in_place_of_education": jobExperienceInPlaceOfEducation,
        "job_min_salary": jobMinSalary,
        "job_max_salary": jobMaxSalary,
        "job_salary_currency": jobSalaryCurrency,
        "job_salary_period": jobSalaryPeriod,
        "job_highlights": jobHighlights?.toJson(),
        "job_job_title": jobJobTitle,
        "job_posting_language": jobPostingLanguage,
        "job_onet_soc": jobOnetSoc,
        "job_onet_job_zone": jobOnetJobZone,
        "job_occupational_categories": jobOccupationalCategories,
        "job_naics_code": jobNaicsCode,
        "job_naics_name": jobNaicsName,
      };
}

class ApplyOption {
  String? publisher;
  String? applyLink;
  bool? isDirect;

  ApplyOption({
    this.publisher,
    this.applyLink,
    this.isDirect,
  });

  factory ApplyOption.fromJson(Map<String, dynamic> json) => ApplyOption(
        publisher: json["publisher"],
        applyLink: json["apply_link"],
        isDirect: json["is_direct"],
      );

  Map<String, dynamic> toJson() => {
        "publisher": publisher,
        "apply_link": applyLink,
        "is_direct": isDirect,
      };
}

class JobHighlights {
  JobHighlights();

  factory JobHighlights.fromJson(Map<String, dynamic> json) => JobHighlights();

  Map<String, dynamic> toJson() => {};
}

class JobRequiredEducation {
  bool? postgraduateDegree;
  bool? professionalCertification;
  bool? highSchool;
  bool? associatesDegree;
  bool? bachelorsDegree;
  bool? degreeMentioned;
  bool? degreePreferred;
  bool? professionalCertificationMentioned;

  JobRequiredEducation({
    this.postgraduateDegree,
    this.professionalCertification,
    this.highSchool,
    this.associatesDegree,
    this.bachelorsDegree,
    this.degreeMentioned,
    this.degreePreferred,
    this.professionalCertificationMentioned,
  });

  factory JobRequiredEducation.fromJson(Map<String, dynamic> json) =>
      JobRequiredEducation(
        postgraduateDegree: json["postgraduate_degree"],
        professionalCertification: json["professional_certification"],
        highSchool: json["high_school"],
        associatesDegree: json["associates_degree"],
        bachelorsDegree: json["bachelors_degree"],
        degreeMentioned: json["degree_mentioned"],
        degreePreferred: json["degree_preferred"],
        professionalCertificationMentioned:
            json["professional_certification_mentioned"],
      );

  Map<String, dynamic> toJson() => {
        "postgraduate_degree": postgraduateDegree,
        "professional_certification": professionalCertification,
        "high_school": highSchool,
        "associates_degree": associatesDegree,
        "bachelors_degree": bachelorsDegree,
        "degree_mentioned": degreeMentioned,
        "degree_preferred": degreePreferred,
        "professional_certification_mentioned":
            professionalCertificationMentioned,
      };
}

class JobRequiredExperience {
  bool? noExperienceRequired;
  dynamic requiredExperienceInMonths;
  bool? experienceMentioned;
  bool? experiencePreferred;

  JobRequiredExperience({
    this.noExperienceRequired,
    this.requiredExperienceInMonths,
    this.experienceMentioned,
    this.experiencePreferred,
  });

  factory JobRequiredExperience.fromJson(Map<String, dynamic> json) =>
      JobRequiredExperience(
        noExperienceRequired: json["no_experience_required"],
        requiredExperienceInMonths: json["required_experience_in_months"],
        experienceMentioned: json["experience_mentioned"],
        experiencePreferred: json["experience_preferred"],
      );

  Map<String, dynamic> toJson() => {
        "no_experience_required": noExperienceRequired,
        "required_experience_in_months": requiredExperienceInMonths,
        "experience_mentioned": experienceMentioned,
        "experience_preferred": experiencePreferred,
      };
}

class Parameters {
  String? query;
  int? page;
  int? numPages;
  String? datePosted;
  bool? remoteJobsOnly;
  List<String>? employmentTypes;
  List<String>? jobRequirements;

  Parameters({
    this.query,
    this.page,
    this.numPages,
    this.datePosted,
    this.remoteJobsOnly,
    this.employmentTypes,
    this.jobRequirements,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        query: json["query"],
        page: json["page"],
        numPages: json["num_pages"],
        datePosted: json["date_posted"],
        remoteJobsOnly: json["remote_jobs_only"],
        employmentTypes: json["employment_types"] == null
            ? []
            : List<String>.from(json["employment_types"]!.map((x) => x)),
        jobRequirements: json["job_requirements"] == null
            ? []
            : List<String>.from(json["job_requirements"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "query": query,
        "page": page,
        "num_pages": numPages,
        "date_posted": datePosted,
        "remote_jobs_only": remoteJobsOnly,
        "employment_types": employmentTypes == null
            ? []
            : List<dynamic>.from(employmentTypes!.map((x) => x)),
        "job_requirements": jobRequirements == null
            ? []
            : List<dynamic>.from(jobRequirements!.map((x) => x)),
      };
}

