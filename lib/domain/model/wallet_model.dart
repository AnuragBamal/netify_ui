import 'package:netify/domain/model/model.dart';

class Transaction {
  final String transactionId;
  final String senderUsername;
  final String receiverUsername;
  final double amount;
  final String transactionStatus;
  final String transactionType;
  final DateTime transactionDate;
  final double? openingBalance;
  final double? closingBalance;
  final String? remarks;
  final String? billNumber;
  final double? billAmount;

  Transaction(
      {required this.transactionId,
      required this.senderUsername,
      required this.receiverUsername,
      required this.amount,
      required this.transactionStatus,
      required this.transactionType,
      required this.transactionDate,
      this.openingBalance,
      this.closingBalance,
      this.remarks,
      this.billNumber,
      required this.billAmount});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionId: json['transactionId'],
      senderUsername: json['senderUsername'],
      receiverUsername: json['receiverUsername'],
      amount: json['amount'],
      transactionStatus: json['transactionStatus'],
      transactionType: json['transactionType'],
      transactionDate: json['transactionDate'],
      openingBalance: json['openingBalance'],
      closingBalance: json['closingBalance'],
      remarks: json['remarks'],
      billNumber: json['billNumber'],
      billAmount: json['billAmount'],
    );
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

class TransactionsData {
  final List<Transaction> transactions;
  final bool isSearch;
  final String screenTypeIdentity;

  TransactionsData(
      {required this.transactions,
      required this.isSearch,
      required this.screenTypeIdentity});

  factory TransactionsData.fromJson(Map<String, dynamic> json) {
    return TransactionsData(
        transactions: (json['transactions'] as List)
            .map((e) => Transaction.fromJson(e))
            .toList(),
        isSearch: json['isSearch'],
        screenTypeIdentity: json['screenTypeIdentity']);
  }
}

class Sale {
  final String billNumber;
  final String planName;
  final String operatorUserName;
  final String resellerUserName;
  final double planBasicCost;
  final double planOfferedCost;
  final double planTax;
  final double planProfit;
  final double billAmount;
  final double totalTaxCollected;
  final double basicBillAmount;
  final String billAmountComponents;
  final DateTime createdAt;

  Sale(
      {required this.billNumber,
      required this.planName,
      required this.operatorUserName,
      required this.resellerUserName,
      required this.planBasicCost,
      required this.planOfferedCost,
      required this.planTax,
      required this.planProfit,
      required this.billAmount,
      required this.createdAt,
      required this.totalTaxCollected,
      required this.basicBillAmount,
      required this.billAmountComponents});

  factory Sale.fromJson(Map<String, dynamic> json) {
    return Sale(
        billNumber: json['billNumber'],
        planName: json['planName'],
        operatorUserName: json['operatorUserName'],
        resellerUserName: json['resellerUserName'],
        planBasicCost: json['planBasicCost'],
        planOfferedCost: json['planOfferedCost'],
        planTax: json['planTax'],
        planProfit: json['planProfit'],
        billAmount: json['billAmount'],
        createdAt: json['createdAt'],
        totalTaxCollected: json['totalTaxCollected'],
        basicBillAmount: json['basicBillAmount'],
        billAmountComponents: json['billAmountComponents']);
  }
}

class SalesData {
  final List<Sale> sales;
  final bool isSearch;
  final String screenTypeIdentity;

  SalesData(
      {required this.sales,
      required this.isSearch,
      required this.screenTypeIdentity});

  factory SalesData.fromJson(Map<String, dynamic> json) {
    return SalesData(
        sales: (json['sales'] as List).map((e) => Sale.fromJson(e)).toList(),
        isSearch: json['isSearch'],
        screenTypeIdentity: json['screenTypeIdentity']);
  }
}
