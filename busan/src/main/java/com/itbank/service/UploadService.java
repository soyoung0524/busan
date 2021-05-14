package com.itbank.service;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadService {

	private final String uploadPath = "C:\\uploadUserImg";
	private String[] extArr = { "jpg", "png", "jpeg", "bmp", "gif" };

	public UploadService() {
		File dir = new File(uploadPath); // 업로드 경로가
		if (dir.exists() == false) { // 존재하지 않으면
			dir.mkdirs(); // 폴더를 새로 만들자
		}
	} // 스프링에 의해서 서비스 객체가 생성될 때

	private boolean isImgFile(String fileName) { // 파일 이름을 전달받아서
		for (String ext : extArr) { // 등록된 확장자 중에서
			if (fileName.toLowerCase().endsWith(ext)) { // 파일이름(소문자처리)이 확장자로 끝나면
				return true; // 이미지 파일이다
			}
		}
		return false; // 모든 확장자에 대해 해당이 없으면 아니다
	}

	public int uploadFile(MultipartFile file) throws IllegalStateException, IOException {

		File f = new File(uploadPath, file.getOriginalFilename());
		// System.out.println("서비스는 잘들어와지나? : " + file.getOriginalFilename());
		if (isImgFile(file.getOriginalFilename())) {
			file.transferTo(f);
		}

		return 1;
	}

	

}