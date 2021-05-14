package com.itbank.review;

import java.util.Date;

public class ReviewDTO {
//   NAME       NOT NULL VARCHAR2(20)  
//   CFTNAME    NOT NULL VARCHAR2(20)  
//   REVIEWDATE NOT NULL DATE          
//   CONTENT    NOT NULL VARCHAR2(100) 

   private String name, cftName,content;
   private Date reviewDate;
   
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getCftName() {
      return cftName;
   }
   public void setCftName(String cftName) {
      this.cftName = cftName;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public Date getReviewDate() {
      return reviewDate;
   }
   public void setReviewDate(Date reviewDate) {
      this.reviewDate = reviewDate;
   }
}