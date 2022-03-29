class listinvoice{
  late int invoice_id;
  late double payment;

  int get information_id {
    return invoice_id;
  }

  void set information_id(int invoice_ID) {
    this.invoice_id = invoice_ID;
  }

  double get payments {
    return payment;
  }

  void set payments(double payment) {
    this.payment = payment;
  }

}