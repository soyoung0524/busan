package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.itbank.insert.InsertDAO;
import com.itbank.insert.MemberDTO;

@Service
public class InsertService {

   @Autowired
   private InsertDAO dao;
   
   public String sameIdCheck(String id) {
      
   //   System.out.println("서비스 아이디 잘들어오나 ? " + id);
      
      String lowId = id.toLowerCase();
   //   System.out.println("아니니 : " + lowId);
      
      String resultId = dao.sameIdCheck(lowId);
      
   //   System.out.println("resultId 는 뭐임 ? " + resultId);
      
      return resultId;
   }

   public int insertNewbie(MemberDTO user) {
      
      return dao.insertNewbie(user);
   }

   public MemberDTO loginCheck(MemberDTO user) {
      
      user.setId(user.getId().toLowerCase());
      
      return dao.loginCheck(user);
   }

   public int updateFileName(String fileName, String id) {
      
      MemberDTO updateDto = new MemberDTO();
      updateDto.setProfile(fileName);
      updateDto.setId(id);
      System.out.println("fileName : " + updateDto.getProfile());
      System.out.println("id : " + updateDto.getId());
      
      return dao.updateFileName(updateDto);
   //   return dao.updateFileName(fileName,id);
   }

   public String callUpdateImgName(String id) {
      
      return dao.callUpdateImgName(id);
   }

public String firstCall(String id) {
	
	return dao.firstCall(id);
}
   
}