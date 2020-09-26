package com.lzr.vo;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public class Caiwubaobiao {
  //月份
  private int months;
  //年份
  private int years;
  //总商量
  private double sums;

  public Caiwubaobiao(){}

  public int getMonths() {
    return months;
  }

  public void setMonths(int months) {
    this.months = months;
  }

  public int getYears() {
    return years;
  }

  public void setYears(int years) {
    this.years = years;
  }

  public double getSums() {
    return sums;
  }

  public void setSums(double sums) {
    this.sums = sums;
  }

  public Caiwubaobiao(int months, int years, double sums) {
    this.months = months;
    this.years = years;
    this.sums = sums;
  }

  @Override
  public String toString() {
    return "Caiwubaobiao{" +
            "months=" + months +
            ", years=" + years +
            ", sums=" + sums +
            '}';
  }
}
