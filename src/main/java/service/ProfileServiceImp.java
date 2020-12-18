package service;

import java.util.List;

import dao.ProfileDAO;
import dto.CatUserDTO;

public class ProfileServiceImp implements ProfileService {
	private ProfileDAO profiledao;

	public void setProfiledao(ProfileDAO profiledao) {
		this.profiledao = profiledao;
	}

	@Override
	public List<CatUserDTO> proflieViewProcess(CatUserDTO dto) {
		return profiledao.profileView(dto);
	}

	@Override
	public List<CatUserDTO> profileUpdateProcess(CatUserDTO dto) {

		profiledao.profileUpdate(dto);
		return profiledao.profileView(dto);
	}

	@Override
	public int checkNicknameProcess(CatUserDTO dto) {
		return profiledao.checkNickname(dto);
	}

}
