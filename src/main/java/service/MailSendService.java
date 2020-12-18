package service;

import dto.CatUserDTO;

public interface MailSendService {
	
	public void keyDataProcess(CatUserDTO dto);
	public String keyDataGetProcess(CatUserDTO dto);
	public void emailDeleteProcess(CatUserDTO dto);
	public int emailCheckProcess(CatUserDTO dto);
	public void updateKeyProcess(CatUserDTO dto);
}
