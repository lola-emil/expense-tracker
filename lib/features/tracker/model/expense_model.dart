class ExpenseModel {
  final String id;
  final String note;
  final String category;
  final double amount;
  final String userId;
  final String createdAt;

  ExpenseModel(
    this.id,
    this.note,
    this.category,
    this.amount,
    this.userId,
    this.createdAt,
  );
}
