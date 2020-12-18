package service;

import dao.MailSendDAO;
import dto.CatUserDTO;

public class MailSendServiceImp implements MailSendService{
	
	private MailSendDAO maildao;
	
	public void setMaildao(MailSendDAO maildao) {
		this.maildao = maildao;
	}
	
	@Override
	public void keyDataProcess(CatUserDTO dto) {
		maildao.keyDataMethod(dto);
	}

	@Override
	public String keyDataGetProcess(CatUserDTO dto) {
		
		return maildao.keyDataGetMethod(dto);
	}

	@Override
	public void emailDeleteProcess(CatUserDTO dto) {
		maildao.emailDeleteMethod(dto);
		
	}
	
	//이메일 중복검사
	@Override
	public int emailCheckProcess(CatUserDTO dto) {
		return maildao.emailCheckMethod(dto);
	}

	@Override
	public void updateKeyProcess(CatUserDTO dto) {
		maildao.updateKeyMethod(dto);
		
	}


	
	
}
