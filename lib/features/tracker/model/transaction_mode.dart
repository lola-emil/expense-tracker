class TransactionModel {
  final String recordId;
  final String note;
  final String category;
  final double amount;
  final String createdAt;
  final String type;

  TransactionModel(this.recordId, this.note, this.category, this.amount,
      this.createdAt, this.type);
}
