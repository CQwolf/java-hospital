package com.offcn.entity;

public class Medicine {
    private String mid;
    private double inPrice;
    private double salPrice;
    private String name;
    private int type;
    private String descs;
    private int qualityDate;
    private String description;
    private String produceFirm;
    private String readme;
    private String remark;

    public Medicine() {
    }

    public Medicine(String mid, double inPrice, double salPrice, String name, int type, String descs, int qualityDate, String description, String produceFirm, String readme, String remark) {
        this.mid = mid;
        this.inPrice = inPrice;
        this.salPrice = salPrice;
        this.name = name;
        this.type = type;
        this.descs = descs;
        this.qualityDate = qualityDate;
        this.description = description;
        this.produceFirm = produceFirm;
        this.readme = readme;
        this.remark = remark;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public double getInPrice() {
        return inPrice;
    }

    public void setInPrice(double inPrice) {
        this.inPrice = inPrice;
    }

    public double getSalPrice() {
        return salPrice;
    }

    public void setSalPrice(double salPrice) {
        this.salPrice = salPrice;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getDescs() {
        return descs;
    }

    public void setDescs(String descs) {
        this.descs = descs;
    }

    public int getQualityDate() {
        return qualityDate;
    }

    public void setQualityDate(int qualityDate) {
        this.qualityDate = qualityDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProduceFirm() {
        return produceFirm;
    }

    public void setProduceFirm(String produceFirm) {
        this.produceFirm = produceFirm;
    }

    public String getReadme() {
        return readme;
    }

    public void setReadme(String readme) {
        this.readme = readme;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
