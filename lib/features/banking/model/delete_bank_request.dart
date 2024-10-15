class DeleteBankRequest {
  final int bankAccountId;

  DeleteBankRequest({required this.bankAccountId});

  Map<String, dynamic> toJson() => {
        "bankAccountId": bankAccountId,
      };
}
