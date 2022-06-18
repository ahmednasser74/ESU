class AddCourseRequestModel {
  final int courseId;

  AddCourseRequestModel({required this.courseId});

  Map<String, dynamic> toJson() => {
        'course_id': courseId,
      };
}
