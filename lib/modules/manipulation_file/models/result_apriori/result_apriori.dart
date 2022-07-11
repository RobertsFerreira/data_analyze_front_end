class ResultApriori {
  final double lift;
  final dynamic consequent;
  final dynamic antecedent;

  ResultApriori({
    required this.lift,
    required this.consequent,
    required this.antecedent,
  });

  factory ResultApriori.empty() {
    return ResultApriori(
      lift: 0,
      consequent: null,
      antecedent: null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lift': lift,
      'consequent': consequent,
      'antecedent': antecedent,
    };
  }

  factory ResultApriori.fromMap(Map<String, dynamic> map) {
    return ResultApriori(
      lift: double.tryParse(map['lift'].toString()) ?? 0.0,
      consequent: map['consequent'],
      antecedent: map['antecedent'],
    );
  }
}
