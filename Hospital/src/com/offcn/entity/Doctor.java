package com.offcn.entity;

import java.util.Date;

public class Doctor {
    private int did;        //医生编号
    private String name;    //医生姓名
    private String cardno;  //身份证号
    private String phone;   //手机号
    private int sex;        //性别0（男）1（女）
    private int age;        //年龄
    private Date birthday;  //出生年月
    private String email;   //邮箱地址
    private int department; //所在科室
    private int education;  //学历
    private String remark;  //备注

    public Doctor() {
    }

    public Doctor(int did, String name, String cardno, String phone, int sex, int age, Date birthday, String email, int department, int education, String remark) {
        this.did = did;
        this.name = name;
        this.cardno = cardno;
        this.phone = phone;
        this.sex = sex;
        this.age = age;
        this.birthday = birthday;
        this.email = email;
        this.department = department;
        this.education = education;
        this.remark = remark;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getDepartment() {
        return department;
    }

    public void setDepartment(int department) {
        this.department = department;
    }

    public int getEducation() {
        return education;
    }

    public void setEducation(int education) {
        this.education = education;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
