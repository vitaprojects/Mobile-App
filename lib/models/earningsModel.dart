
class EarningsModel {
  double totalEarnings;
  int commpletedJobs;
  int cancelledJobs;
  int ongoingJobs;
  int pendingJobs;
  String date;

  ///* default constructor s for months
  EarningsModel({
    this.totalEarnings,
    this.commpletedJobs,
    this.cancelledJobs,
    this.ongoingJobs,
    this.pendingJobs,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'totalEarnings': totalEarnings,
      'commpletedJobs': commpletedJobs,
      'cancelledJobs': cancelledJobs,
      'ongoingJobs': ongoingJobs,
      'pendingJobs': pendingJobs,
      'date': date,
    };
  }

  factory EarningsModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EarningsModel(
      totalEarnings: map['totalEarnings'],
      commpletedJobs: map['commpletedJobs'],
      cancelledJobs: map['cancelledJobs'],
      ongoingJobs: map['ongoingJobs'],
      pendingJobs: map['pendingJobs'],
      date: map['date'],
    );
  }

  EarningsModel copyWith({
    double totalEarnings,
    int commpletedJobs,
    int cancelledJobs,
    int ongoingJobs,
    int pendingJobs,
    String date,
  }) {
    return EarningsModel(
      totalEarnings: totalEarnings ?? this.totalEarnings,
      commpletedJobs: commpletedJobs ?? this.commpletedJobs,
      cancelledJobs: cancelledJobs ?? this.cancelledJobs,
      ongoingJobs: ongoingJobs ?? this.ongoingJobs,
      pendingJobs: pendingJobs ?? this.pendingJobs,
      date: date ?? this.date,
    );
  }
}
