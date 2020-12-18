package dao;

import dto.CatUserDTO;

public interface MailSendDAO {
	
	public void keyDataMethod(CatUserDTO dto);
	public String keyDataGetMethod(CatUserDTO dto);
	public void emailDeleteMethod(CatUserDTO dto);
	public int emailCheckMethod(CatUserDTO dto);
	public void updateKeyMethod(CatUserDTO dto);
}
