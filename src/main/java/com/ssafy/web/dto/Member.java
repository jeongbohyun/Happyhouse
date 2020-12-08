package com.ssafy.web.dto;

public class Member {

   private String userid;
   private String username;
   private String userpwd;
   private String permission;
   
   private int hakgun;
   private int cafe;
   private int hospital;
   private int theater;
   private int depart;
   private int mac;
   private int subway;
   
   

   public Member(String userid, String username, String userpwd, String permission, int hakgun, int cafe, int hospital,
         int theater, int depart, int mac, int subway) {
      super();
      this.userid = userid;
      this.username = username;
      this.userpwd = userpwd;
      this.permission = permission;
      
      this.hakgun = hakgun;
      this.cafe = cafe;
      this.hospital = hospital;
      this.theater = theater;
      this.depart = depart;
      this.mac = mac;
      this.subway = subway;
   }


   public int getHakgun() {
      return hakgun;
   }

   public void setHakgun(int hakgun) {
      this.hakgun = hakgun;
   }

   public int getCafe() {
      return cafe;
   }

   public void setCafe(int cafe) {
      this.cafe = cafe;
   }

   public int getHospital() {
      return hospital;
   }

   public void setHospital(int hospital) {
      this.hospital = hospital;
   }

   public int getTheater() {
      return theater;
   }

   public void setTheater(int theater) {
      this.theater = theater;
   }

   public int getDepart() {
      return depart;
   }

   public void setDepart(int depart) {
      this.depart = depart;
   }

   public int getMac() {
      return mac;
   }

   public void setMac(int mac) {
      this.mac = mac;
   }

   public int getSubway() {
      return subway;
   }

   public void setSubway(int subway) {
      this.subway = subway;
   }

   public String getUserid() {
      return userid;
   }

   public void setUserid(String userid) {
      this.userid = userid;
   }

   public String getUsername() {
      return username;
   }

   public void setUsername(String username) {
      this.username = username;
   }

   public String getUserpwd() {
      return userpwd;
   }

   public void setUserpwd(String userpwd) {
      this.userpwd = userpwd;
   }
   public String getPermission() {
      return permission;
   }
   public void setPermission(String permission) {
      this.permission = permission;
   }

   @Override
   public String toString() {
      return "Member [userid=" + userid + ", username=" + username + ", userpwd=" + userpwd + ", permission="
            + permission + ", hakgun=" + hakgun + ", cafe=" + cafe + ", hospital=" + hospital + ", theater="
            + theater + ", depart=" + depart + ", mac=" + mac + ", subway=" + subway + "]";
   }


   
   

}