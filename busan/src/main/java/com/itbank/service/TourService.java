package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.tour.TourDAO;
import com.itbank.tour.TourDTO;

@Service
public class TourService {
   
   @Autowired private TourDAO dao;
   
   public List<TourDTO> getTourList() {
      List<TourDTO> list = dao.getTourList();
      return list;
   }

   public TourDTO getSelectOne(String tname) {
      TourDTO dto = dao.getSelectOne(tname);
      return dto;
   }

   public List<TourDTO> getSelectList(String addr) {
      List<TourDTO> list = dao.getSelectList(addr);
      return list;
   }

	public List<TourDTO> searchTour(String search) {
		return dao.searchTour(search);
	}


}