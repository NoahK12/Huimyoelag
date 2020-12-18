package dao;

import dto.CatUserDTO;

public interface AuthDAO {
	
	public int registIdentifyMethod(CatUserDTO dto);
	public int loginIdentifyMethod(CatUserDTO dto);
	public void RegistMethod(CatUserDTO dto);
	
	public int emailCheckMethod(CatUserDTO dto);
	public int nicknameCheckMethod(CatUserDTO dto);
	//이메일 검색하여 아이디값 가져오기
	public CatUserDTO getSessionMethod(CatUserDTO dto);
}
