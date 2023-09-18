import 'package:netify/domain/model/model.dart';

class Transaction {
  final String transactionId;
  final String senderUsername;
  final String receiverUsername;
  final double amount;
  final String transactionStatus;
  final String transactionType;
  final DateTime transactionDate;

  Transaction(
      {required this.transactionId,
      required this.senderUsername,
      required this.receiverUsername,
      required this.amount,
      required this.transactionStatus,
      required this.transactionType,
      required this.transactionDate});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        transactionId: json['transactionId'],
        senderUsername: json['senderUsername'],
        receiverUsername: json['receiverUsername'],
        amount: json['amount'],
        transactionStatus: json['transactionStatus'],
        transactionType: json['transactionType'],
        transactionDate: json['transactionDate']);
  }
}

class Payee {
  final String userName;
  final String userId;

  Payee({required this.userName, required this.userId});

  factory Payee.fromJson(Map<String, dynamic> json) {
    return Payee(userName: json['userName'], userId: json['userId']);
  }
}

class UserWallet {
  final double balance;
  final List<Transaction> transactions;
  final List<Payee> payee;

  UserWallet(
      {required this.balance, required this.transactions, required this.payee});

  factory UserWallet.fromJson(Map<String, dynamic> json) {
    return UserWallet(
        balance: json['balance'],
        transactions: (json['transactions'] as List)
            .map((e) => Transaction.fromJson(e))
            .toList(),
        payee: (json['payee'] as List).map((e) => Payee.fromJson(e)).toList());
  }
}

class PaymentProfileMeta {
  final String role;
  final String ownerUserName;
  final String userName;
  List<MainPageModel> paymentScreens;

  PaymentProfileMeta(
      {required this.role,
      required this.ownerUserName,
      required this.userName,
      required this.paymentScreens});

  factory PaymentProfileMeta.fromJson(Map<String, dynamic> json) {
    return PaymentProfileMeta(
        role: json['role'],
        ownerUserName: json['ownerUserName'],
        userName: json['userName'],
        paymentScreens: (json['paymentScreens'] as List)
            .map((e) => MainPageModel.fromJson(e))
            .toList());
  }
}
