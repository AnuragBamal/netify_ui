class ScreenTypeIdentity {
  static const String reseller = "resellerScreen";
  static const String operator = "operatorScreen";
  static const String subscriber = "subscriberScreen";
  static const String subscription = "subscriptionScreen";
  static const String plans = "plansScreen";
  static const String resellerPriceChart = "resellerPriceChartScreen";
  static const String operatorPriceChart = "operatorPriceChartScreen";
  static const String nasEntries = "nasEntriesScreen";
  static const String serviceSubscriptions = "ServiceSubscriptionsScreen";
  static const String wallet = "walletScreen";
  static const String transactions = "transactionsScreen";
  static const String bills = "billsScreen";
  static const String biller = "billerScreen";
  static const String unpaidBills = "unpaidBillsScreen";
  static const String upcomingRenewals = "upcomingRenewalsScreen";
  static const String salesTransactions = "salesTransactionsScreen";
  static const String sales = "salesTransactionsScreen";
}

class DataTypeIdentity {
  static const String user = "user";
  static const String dashboard = "dashboard";
  static const String subscriber = "subscriber";
  static const String subscription = "subscription";
  static const String operatorPriceChart = "operatorPriceChart";
  static const String resellerPriceChart = "resellerPriceChart";
  static const String plan = "plan";
  static const String nasEntries = "nasEntries";
  static const String serviceSubscriptions = "ServiceSubscriptions";
  static const String wallet = "wallet";
  static const String transactions = "transactions";
  static const String bills = "bills";
  static const String biller = "biller";
  static const String renewals = "renewals";
  static const String salesTransactions = "saleTransaction";
}

class Roles {
  static const String reseller = "RESELLER";
  static const String operator = "OPERATOR";
  static const String admin = "ADMIN";
}

class ScreenViewType {
  static const String grid = "gridView";
  static const String list = "listView";
  static const String table = "tableView";
}

class DashboardType {
  static const String homePage = "homePageDashboard";
  static const String plan = "planDashboard";
  static const String payment = "paymentDashboard";
  static const String setting = "settingDashboard";
  static const String report = "reportDashboard";
  static const String billing = "billingDashboard";
}

class PanelButtonType {
  static const String action = "action";
  static const String download = "download";
}

class TransactionType {
  static const String w2w = "W2W";
  static const String offlineSale = "OFFLINE-SALE";
}

class TranasctionStatus {
  static const String intiated = "Initiated";
  static const String failed = "Failed";
  static const String success = "Success";
  static const String pending = "Pending";
}

class PlanType {
  static const String fup = "FUP";
  static const String unlimited = "Unlimited";
  static const String limited = "Limited";
}
