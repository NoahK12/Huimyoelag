package service;


import java.util.List;

import dto.CatUserDTO;

public interface ProfileService {
	public List<CatUserDTO> proflieViewProcess(CatUserDTO dto);
	public List<CatUserDTO> profileUpdateProcess(CatUserDTO dto);
	public int checkNicknameProcess(CatUserDTO dto);
	
}
