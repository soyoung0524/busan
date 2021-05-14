package com.itbank.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.service.InsertService;
import com.itbank.service.UploadService;

// ajaxController
@RestController
public class InsertController {
   
   @Autowired
   private InsertService is;
   @Autowired
   private UploadService us;
   
   private String fileName;
   
   
   @GetMapping(value="firstCall/{id}", produces = "application/text;charset=utf8")
   public String firstCall(@PathVariable String id) {
	   System.out.println("처음 호출되나?? ");
	   
	   String profileName = is.firstCall(id);
	   System.out.println("프로필이름 : " + profileName);
	   
	   return profileName;
	   
   }
   
   @GetMapping(value="idCheck/{id}", produces="application/text;charset=utf8")
   public String idCheck(@PathVariable String id) {
      //System.out.println("잘들어오나 ? " + id);
      
      String row = is.sameIdCheck(id);
      //System.out.println("row는 뭐고? : " + row);
      
      
      return row;
   }
   
   @PostMapping(value="upload", produces="application/text;charset=utf8")
   public String upload(MultipartFile file) throws IllegalStateException, IOException {
      
      //System.out.println("파일이름 : " + file.getOriginalFilename());
      fileName = file.getOriginalFilename();
      
      int row = us.uploadFile(file);
      
      //System.out.println("업로드? : " + row);
      
      
      return null;
   }
   @GetMapping(value="updateImg/{id}",produces = "application/text;charset=utf8")
   public void updateImg(@PathVariable String id) {
   //   System.out.println("디비에 업데이트시키는 것");
   //   System.out.println("id는뭐임 ? : " + id);
   //   System.out.println("파일이름은뭐임 ? : " + fileName);
      int row = is.updateFileName(fileName,id);
   //   System.out.println("성공? : " + row);
   }
   
   @GetMapping(value="callImg/{id}",produces = "application/text;charset=utf8")
   public String recallImg(@PathVariable String id) {
      System.out.println("id : " + id);
      String imgName = is.callUpdateImgName(id);
      
      return imgName;
   }
   
}