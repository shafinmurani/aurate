class GoldRate {
  final String purity;
  final String element = 'Gold';
  final String date;
  final String currency;
  final double ratePerTenGm;
  final double ratePerGm;
  final String fluctuation;
  GoldRate({
    required this.purity,
    required this.date,
    required this.currency,
    required this.ratePerTenGm,
    required this.ratePerGm,
    required this.fluctuation,
  });
  Map<String, dynamic> toJson() => {
        'purity': purity,
        'date': date,
        'currency': currency,
        'rate_per_10gm': ratePerTenGm,
        'rate_per_1gm': ratePerGm,
        'fluctuation': fluctuation,
      };
}
