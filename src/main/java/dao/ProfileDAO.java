package dao;

import java.util.List;

import dto.CatUserDTO;

public interface ProfileDAO {
	public List<CatUserDTO> profileView(CatUserDTO dto);
	public List<CatUserDTO> profileUpdate(CatUserDTO dto);
	public int checkNickname(CatUserDTO dto);
	

}
