package service;

import dto.CatUserDTO;

public interface AuthService {
	
	public int registIdentifyProcess(CatUserDTO dto);
	public int loginIdentifyProcess(CatUserDTO dto);
	public void RegistProcess(CatUserDTO dto);
	
	
	public int emailCheckProcess(CatUserDTO dto);
	public int nicknameCheckProcess(CatUserDTO dto);
	//이메일로 검색하여 아이디값 가져오기
	public CatUserDTO getSessionProcess(CatUserDTO dto);
}
