package com.itbank.insert;

public interface InsertDAO {

   String sameIdCheck(String lowId);

   int insertNewbie(MemberDTO user);

   MemberDTO loginCheck(MemberDTO user);

   int updateFileName(MemberDTO updateDto);

   String callUpdateImgName(String id);

   String firstCall(String id);

}