package service;

import java.util.List;

import dao.mainPageDAO;
import dto.CatDTO;
import dto.CatUserDTO;

public class mainPageServiceImp implements mainPageService {
	private mainPageDAO dao;

	public mainPageServiceImp() {
		// TODO Auto-generated constructor stub
	}

	public void setDao(mainPageDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<CatUserDTO> songProcess(CatUserDTO dto) {
		// TODO Auto-generated method stub
		return dao.songMethod(dto);
	}

	@Override
	public List<CatDTO> songyjProcess(CatDTO dto) {
		// TODO Auto-generated method stub
		return dao.songyjMethod(dto);
	}

}
