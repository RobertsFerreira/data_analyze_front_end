class ResultApriori {
  final double lift;
  final double consequent;
  final double antecedent;

  ResultApriori({
    required this.lift,
    required this.consequent,
    required this.antecedent,
  });

  factory ResultApriori.empty() {
    return ResultApriori(
      lift: 0,
      consequent: 0,
      antecedent: 0,
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
      consequent: double.tryParse(map['consequent'].toString()) ?? 0.0,
      antecedent: double.tryParse(map['antecedent'].toString()) ?? 0.0,
    );
  }
}
