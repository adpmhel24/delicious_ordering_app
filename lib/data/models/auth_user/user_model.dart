class UserModel {
  int? id;
  String? username;
  String? fullname;
  String? dateUpdated;
  String? branch;
  String? whse;
  bool? isActive;
  bool? isAdmin;
  bool? isSuperAdmin;
  bool? isManager;
  bool? isAuditor;
  bool? isSales;
  bool? isCashier;
  bool? isProduction;
  bool? isAgentSales;
  bool? isCashSales;
  bool? isARSales;
  bool? isAccounting;
  bool? isCanAddSap;
  bool? isCanAddActualCash;
  bool? isAllowConfidential;
  bool? isAllowItemAdjustment;
  bool? isAllowProdOrder;
  bool? isAllowIssueForProd;
  bool? isAllowReceiveFromProd;
  bool? isAllowTransfer;
  bool? isAllowReceive;
  bool? isAllowEnding;
  bool? isAllowPullOut;
  bool? isAllowDeposit;
  bool? isAllowPayment;
  bool? isAllowSales;
  bool? isAllowSoa;
  bool? isAllowForecast;
  bool? isAllowInventoryReturn;
  bool? isAllowItemSalesSummaryReport;
  bool? isAllowBranchSalesSummaryReport;
  bool? isAllowCustomerSalesSummaryReport;
  bool? isAllowFinalPrintedReport;
  bool? isAllowToAdd;
  bool? isAllowToConfirm;
  bool? isAllowToCancel;
  bool? isAllowToUpdate;
  bool? isAllowToClose;
  bool? isAllowToVoid;
  bool? isAllowToDiscount;
  bool? isAllowToPayAR;
  bool? isAllowToPayCash;
  bool? isAllowToPayAgent;
  bool? isAllowToReceivePO;
  bool? isAllowToCustomer;
  late String token;

  UserModel(
      {this.id,
      this.username,
      this.fullname,
      this.dateUpdated,
      this.branch,
      this.whse,
      this.isActive,
      this.isAdmin,
      this.isSuperAdmin,
      this.isManager,
      this.isAuditor,
      this.isSales,
      this.isCashier,
      this.isProduction,
      this.isAgentSales,
      this.isCashSales,
      this.isARSales,
      this.isAccounting,
      this.isCanAddSap,
      this.isCanAddActualCash,
      this.isAllowConfidential,
      this.isAllowItemAdjustment,
      this.isAllowProdOrder,
      this.isAllowIssueForProd,
      this.isAllowReceiveFromProd,
      this.isAllowTransfer,
      this.isAllowReceive,
      this.isAllowEnding,
      this.isAllowPullOut,
      this.isAllowDeposit,
      this.isAllowPayment,
      this.isAllowSales,
      this.isAllowSoa,
      this.isAllowForecast,
      this.isAllowInventoryReturn,
      this.isAllowItemSalesSummaryReport,
      this.isAllowBranchSalesSummaryReport,
      this.isAllowCustomerSalesSummaryReport,
      this.isAllowFinalPrintedReport,
      this.isAllowToAdd,
      this.isAllowToConfirm,
      this.isAllowToCancel,
      this.isAllowToUpdate,
      this.isAllowToClose,
      this.isAllowToVoid,
      this.isAllowToDiscount,
      this.isAllowToPayAR,
      this.isAllowToPayCash,
      this.isAllowToPayAgent,
      this.isAllowToReceivePO,
      this.isAllowToCustomer,
      required this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullname = json['fullname'];
    dateUpdated = json['date_updated'];
    branch = json['branch'];
    whse = json['whse'];
    isActive = json['isActive'];
    isAdmin = json['isAdmin'];
    isSuperAdmin = json['isSuperAdmin'];
    isManager = json['isManager'];
    isAuditor = json['isAuditor'];
    isSales = json['isSales'];
    isCashier = json['isCashier'];
    isProduction = json['isProduction'];
    isAgentSales = json['isAgentSales'];
    isCashSales = json['isCashSales'];
    isARSales = json['isARSales'];
    isAccounting = json['isAccounting'];
    isCanAddSap = json['isCanAddSap'];
    isCanAddActualCash = json['isCanAddActualCash'];
    isAllowConfidential = json['isAllowConfidential'];
    isAllowItemAdjustment = json['isAllowItemAdjustment'];
    isAllowProdOrder = json['isAllowProdOrder'];
    isAllowIssueForProd = json['isAllowIssueForProd'];
    isAllowReceiveFromProd = json['isAllowReceiveFromProd'];
    isAllowTransfer = json['isAllowTransfer'];
    isAllowReceive = json['isAllowReceive'];
    isAllowEnding = json['isAllowEnding'];
    isAllowPullOut = json['isAllowPullOut'];
    isAllowDeposit = json['isAllowDeposit'];
    isAllowPayment = json['isAllowPayment'];
    isAllowSales = json['isAllowSales'];
    isAllowSoa = json['isAllowSoa'];
    isAllowForecast = json['isAllowForecast'];
    isAllowInventoryReturn = json['isAllowInventoryReturn'];
    isAllowItemSalesSummaryReport = json['isAllowItemSalesSummaryReport'];
    isAllowBranchSalesSummaryReport = json['isAllowBranchSalesSummaryReport'];
    isAllowCustomerSalesSummaryReport =
        json['isAllowCustomerSalesSummaryReport'];
    isAllowFinalPrintedReport = json['isAllowFinalPrintedReport'];
    isAllowToAdd = json['isAllowToAdd'];
    isAllowToConfirm = json['isAllowToConfirm'];
    isAllowToCancel = json['isAllowToCancel'];
    isAllowToUpdate = json['isAllowToUpdate'];
    isAllowToClose = json['isAllowToClose'];
    isAllowToVoid = json['isAllowToVoid'];
    isAllowToDiscount = json['isAllowToDiscount'];
    isAllowToPayAR = json['isAllowToPayAR'];
    isAllowToPayCash = json['isAllowToPayCash'];
    isAllowToPayAgent = json['isAllowToPayAgent'];
    isAllowToReceivePO = json['isAllowToReceivePO'];
    isAllowToCustomer = json['isAllowToCustomer'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['fullname'] = this.fullname;
    data['date_updated'] = this.dateUpdated;
    data['branch'] = this.branch;
    data['whse'] = this.whse;
    data['isActive'] = this.isActive;
    data['isAdmin'] = this.isAdmin;
    data['isSuperAdmin'] = this.isSuperAdmin;
    data['isManager'] = this.isManager;
    data['isAuditor'] = this.isAuditor;
    data['isSales'] = this.isSales;
    data['isCashier'] = this.isCashier;
    data['isProduction'] = this.isProduction;
    data['isAgentSales'] = this.isAgentSales;
    data['isCashSales'] = this.isCashSales;
    data['isARSales'] = this.isARSales;
    data['isAccounting'] = this.isAccounting;
    data['isCanAddSap'] = this.isCanAddSap;
    data['isCanAddActualCash'] = this.isCanAddActualCash;
    data['isAllowConfidential'] = this.isAllowConfidential;
    data['isAllowItemAdjustment'] = this.isAllowItemAdjustment;
    data['isAllowProdOrder'] = this.isAllowProdOrder;
    data['isAllowIssueForProd'] = this.isAllowIssueForProd;
    data['isAllowReceiveFromProd'] = this.isAllowReceiveFromProd;
    data['isAllowTransfer'] = this.isAllowTransfer;
    data['isAllowReceive'] = this.isAllowReceive;
    data['isAllowEnding'] = this.isAllowEnding;
    data['isAllowPullOut'] = this.isAllowPullOut;
    data['isAllowDeposit'] = this.isAllowDeposit;
    data['isAllowPayment'] = this.isAllowPayment;
    data['isAllowSales'] = this.isAllowSales;
    data['isAllowSoa'] = this.isAllowSoa;
    data['isAllowForecast'] = this.isAllowForecast;
    data['isAllowInventoryReturn'] = this.isAllowInventoryReturn;
    data['isAllowItemSalesSummaryReport'] = this.isAllowItemSalesSummaryReport;
    data['isAllowBranchSalesSummaryReport'] =
        this.isAllowBranchSalesSummaryReport;
    data['isAllowCustomerSalesSummaryReport'] =
        this.isAllowCustomerSalesSummaryReport;
    data['isAllowFinalPrintedReport'] = this.isAllowFinalPrintedReport;
    data['isAllowToAdd'] = this.isAllowToAdd;
    data['isAllowToConfirm'] = this.isAllowToConfirm;
    data['isAllowToCancel'] = this.isAllowToCancel;
    data['isAllowToUpdate'] = this.isAllowToUpdate;
    data['isAllowToClose'] = this.isAllowToClose;
    data['isAllowToVoid'] = this.isAllowToVoid;
    data['isAllowToDiscount'] = this.isAllowToDiscount;
    data['isAllowToPayAR'] = this.isAllowToPayAR;
    data['isAllowToPayCash'] = this.isAllowToPayCash;
    data['isAllowToPayAgent'] = this.isAllowToPayAgent;
    data['isAllowToReceivePO'] = this.isAllowToReceivePO;
    data['isAllowToCustomer'] = this.isAllowToCustomer;
    data['token'] = this.token;
    return data;
  }
}
