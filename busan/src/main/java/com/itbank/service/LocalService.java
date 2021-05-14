package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.local.LocalDAO;
import com.itbank.local.LocalDTO;

@Service
public class LocalService {

   @Autowired
   private LocalDAO localDAO;
   
   public List<LocalDTO> getLocalList() {

      List<LocalDTO> localList = localDAO.getLocalList();
      
      return localList;
   }

}