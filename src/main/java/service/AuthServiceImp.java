package service;

import dao.AuthDAO;
import dto.CatUserDTO;

public class AuthServiceImp implements AuthService {
	
private AuthDAO authdao;
	
	
	public void setAuthdao(AuthDAO authdao) {
		this.authdao = authdao;
	}

	
	//이메일과 인증키가 DB에 있는지 검사
	@Override
	public int registIdentifyProcess(CatUserDTO dto) {
		return authdao.registIdentifyMethod(dto);
	}

	
	//해당이메일일때 나머지값 입력되게 업데이트
	@Override
	public void RegistProcess(CatUserDTO dto) {
		authdao.RegistMethod(dto);
	}

	
	//로그인시 이메일 비밀번호를 검색
	@Override
	public int loginIdentifyProcess(CatUserDTO dto) {
		return authdao.loginIdentifyMethod(dto);
	}

	
	//이메일 중복검사
	@Override
	public int emailCheckProcess(CatUserDTO dto) {
		return authdao.emailCheckMethod(dto);
	}

	
	//닉네임 중복검사
	@Override
	public int nicknameCheckProcess(CatUserDTO dto) {
		return authdao.nicknameCheckMethod(dto);
	}

	//이메일로 검색하여 아이디값 가져오기
	@Override
	public CatUserDTO getSessionProcess(CatUserDTO dto) {
		return authdao.getSessionMethod(dto);
	}
	
	
	
	
	
}
