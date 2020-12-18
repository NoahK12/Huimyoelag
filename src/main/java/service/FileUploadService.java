package service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
	public String restore(MultipartFile multipartFile, HttpServletRequest request);
}
