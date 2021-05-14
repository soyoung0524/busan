package com.itbank.tour;

import java.util.List;

public interface TourDAO {

   List<TourDTO> getTourList();

   List<TourDTO> getSelectList(String addr);

   TourDTO getSelectOne(String tname);

   List<TourDTO> searchTour(String search);

}