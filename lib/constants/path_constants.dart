class PathConstants {
  static String get baseURL => "https://alp-expense-tracking-app.herokuapp.com";
  static String get registerUrl => "$baseURL/auth/signup";
  static String get loginUrl => "$baseURL/auth/signin";
  static String get expenseUrl => "$baseURL/expense";
  static String get balanceUrl => "$expenseUrl/balance";
}
